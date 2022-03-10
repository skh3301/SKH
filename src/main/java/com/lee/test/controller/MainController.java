package com.lee.test.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.lee.test.dao.MemberDao;
import com.lee.test.dao.ProjectDao;
import com.lee.test.dto.Member;
import com.lee.test.dto.ProjectSelected;
import com.lee.test.dto.UpHeartResult;
import com.lee.test.service.CheckHeart;
import com.lee.test.service.CheckId;
import com.lee.test.service.CheckName;
import com.lee.test.service.ListProject;
import com.lee.test.service.MemberJoin;
import com.lee.test.service.MemberService;
import com.lee.test.service.OrderBy;
import com.lee.test.service.ProjectService;
import com.lee.test.service.RegisterProject;
import com.lee.test.service.ReplyWrite;
import com.lee.test.service.Search;
import com.lee.test.service.SelectOne;
import com.lee.test.util.Constant;

@Controller
public class MainController {
	
	private MemberDao mdao;
	private ProjectDao pdao;
	
	@Autowired
	public void setMdao(MemberDao mdao) {
		this.mdao = mdao;
		Constant.mdao = mdao;
	}
	@Autowired
	public void setPdao(ProjectDao pdao) {
		this.pdao = pdao;
		Constant.pdao = pdao;
	}
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	
	private MemberService ms;
	private ProjectService ps;
	
	@RequestMapping("/home")
	public String home() {
		return "index";
	}
	
	
	// ========== 회원 가입 / 로그인 ==========
	@RequestMapping("/login_join")
	public String login_join() {
		return "login_join";
	}
	
		// ========== id 중복확인 ==========
	@RequestMapping(value="/idChk", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public int idChk(HttpServletRequest request,HttpServletResponse response,Model model) {
		ms = new CheckId();
		ms.execute(model, request);
		int result = (Integer)request.getAttribute("checkingId");
		return result;	// 1이나 0이 반환
	}
	
		// ========== name 중복확인 ==========
	@RequestMapping(value="/nameChk", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public int nameChk(HttpServletRequest request,HttpServletResponse response,Model model) {
		ms = new CheckName();
		ms.execute(model, request);
		int result = (Integer)request.getAttribute("checkingName");
		return result;	// 1이나 0이 반환
	}
	
		// ========== 회원 가입 ==========
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MultipartHttpServletRequest mtfRequest,Model model) {		
		
		String memId = mtfRequest.getParameter("memId");
		System.out.println(memId);
		String memPw = mtfRequest.getParameter("memPw");
		String memName = mtfRequest.getParameter("memName");
		String memPhoto; // db 저장용 파일명
		
		MultipartFile mf = mtfRequest.getFile("memPhoto");
		String path="C:/project/prj/test/src/main/webapp/resources/repository/mem/";
		String path1 = "C:/project/download/apache-tomcat-9.0.53/wtpwebapps/test/resources/repository/mem/";
		String originFileName = mf.getOriginalFilename();
		String safeFile = path + System.currentTimeMillis() + originFileName; //서버에서 중복되지 않는 이름을 부여
		String safeFile1 = path1 + System.currentTimeMillis() + originFileName;
		if(mf.getSize()<10) {
			memPhoto="default.png";
		} else {
			memPhoto = System.currentTimeMillis() + originFileName;
		}
		Member dto = new Member(memId, memPw, memName, memPhoto);
		mtfRequest.setAttribute("dto", dto);
		
		ms = new MemberJoin();
		ms.execute(model, mtfRequest);	// 이 시점에서, DB에 저장 완료 + 결과가 result 속성에 담겨있음
		
		Map<String, Object> map = model.asMap();
		String res = (String) map.get("result");
		
		if(res.equals("success")) {
			try {
				if(mf.getSize()<10) {
					System.out.println("첨부파일 없음");
				} else {
					mf.transferTo(new File(safeFile));
					mf.transferTo(new File(safeFile1));
					System.out.println("첨부파일 등록 완료");
				}
			} catch(Exception e) {
				e.getMessage();
			}
			return "login_join";
		}
		else {
			return "login_join";
		}
		
	}
		// ========== 시큐리티 로그인 ==========
	@RequestMapping(value = "/processLogin", method = RequestMethod.GET)
	public ModelAndView processLogin(
			@RequestParam(value = "log", required = false) String log,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout
			) {
		
		System.out.println("log");
		ModelAndView model = new ModelAndView();
		if (log != null && log !="") {
			model.addObject("log", "before login!");
		}
		if (error != null && error != "") {
			model.addObject("error", "Invalid username or password!");
		} 
		if (logout != null && logout != "") {
			model.addObject("logout", "You've been logged out successfully.");
		}	
		model.setViewName("login_join");
		return model;
	}	
	
	@RequestMapping("/Login")  //로그인 없이 auth필요 페이지 접속시도시 스프링이 자동 호출하는 요청
	public String Login() {
		System.out.println("LOGIN");
		return "login_join";
	}
	
	// ========== 게시판 ==========
		// ========== 게시물 찾기(제목으로) ==========
	@RequestMapping("/search")
	public String search(HttpServletRequest request,HttpServletResponse response,Model model) {
		String title = request.getParameter("title");
		ps = new Search(title);
		ps.execute(model, request);
		request.setAttribute("keyword", title);
		return "search";
	}

		// ========== 게시판 조회(웹 애플리케이션 : pCode 1) ==========
	@RequestMapping("/webprj") 
	public String webprj(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new ListProject(1);
		ps.execute(model, request);
		return "webprj";
	}
		// ========== 게시판 조회(웹 애플리케이션 : pCode 2) ==========
	@RequestMapping("/game") 
	public String game(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new ListProject(2);
		ps.execute(model, request);
		return "game";
	}
		// ========== 게시판 조회(웹 애플리케이션 : pCode 3) ==========
	@RequestMapping("/music") 
	public String music(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new ListProject(3);
		ps.execute(model, request);
		return "music";
	}
		// ========== 게시물 리스트 순서 ==========
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request,HttpServletResponse response,Model model) {
		int group = Integer.parseInt(request.getParameter("group"));
		request.removeAttribute("projectList");
		ps = new OrderBy();
		ps.execute(model, request);
		if (group==1) {
			return "webprj";
		} else if(group==2) {
			return "game";
		} else if(group==3) {
			return "music";
		} else
			return "find";
	}
	
		// ========== 게시물 조회(ajax로 받아서 클라이언트로 보냄(모달에 쏠거임) ==========
	@RequestMapping(value="/select_one", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public Object select_one(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new SelectOne();
		ps.execute(model, request);
		ProjectSelected result = (ProjectSelected)request.getAttribute("prjSelected");
		return result;
	}
	
		// ========== 댓글 등록(ajax로 받아서 클라이언트로 보냄) ==========
	@RequestMapping(value="/reply_write", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public Object reply_write(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new ReplyWrite();
		ps.execute(model, request);
		ProjectSelected result = (ProjectSelected)request.getAttribute("prjSelected");
		return result;
	}
	
		// ========== 하트 누르기(ajax로 받아서 클라이언트로 보냄) ==========
	@RequestMapping(value="/heart_up", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public Object heart_up(HttpServletRequest request,HttpServletResponse response,Model model) {
		ps = new CheckHeart();
		ps.execute(model, request);
		UpHeartResult result = (UpHeartResult)request.getAttribute("heartResult");
		return result;
	}

		// ========== 게시물 등록 ==========
	@RequestMapping("/prj_write")	// 프로젝트 등록화면 리퀘스트 매핑
	public String product(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "prj_write";
	}
	
	@RequestMapping("/register")	// 실제 submit 눌렀을 때 처리
	public String register (MultipartHttpServletRequest mtfRequest,Model model) {
		// 첨부파일 주소 처리
		int group = Integer.parseInt(mtfRequest.getParameter("bGroup"));
		String bPhoto;
		
		MultipartFile mf = mtfRequest.getFile("bPhoto");
		String path="C:/project/prj/test/src/main/webapp/resources/repository/project/";
		String path1 = "C:/project/download/apache-tomcat-9.0.53/wtpwebapps/test/resources/repository/project/";
		String originFileName = mf.getOriginalFilename();
		String safeFile = path + System.currentTimeMillis() + originFileName;
		String safeFile1 = path1 + System.currentTimeMillis() + originFileName;
		if(mf.getSize()<10) {
			bPhoto="default.png";
		} else {
			bPhoto = System.currentTimeMillis() + originFileName;
		}
		mtfRequest.setAttribute("bPhoto", bPhoto);
		ps = new RegisterProject();
		ps.execute(model, mtfRequest);
		
		Map<String, Object> map = model.asMap();
		String res = (String) map.get("result");
		
		if(res.equals("success")) {
			try {
				if(mf.getSize()<10) {
					System.out.println("첨부파일 없음");
				} else {
					mf.transferTo(new File(safeFile));
					mf.transferTo(new File(safeFile1));
					System.out.println("첨부파일 등록 완료");
				}
			} catch(Exception e) {
				e.getMessage();
			}
			if(group==1)
				return "forward:webprj";
			else if(group==2)
				return "forward:game";
			else
				return "forward:music";
		}
		else {
			return "prj_write";
		}
	}
}
