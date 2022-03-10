package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lee.test.dao.ProjectDao;
import com.lee.test.dto.ProjectSelected;
import com.lee.test.util.Constant;

public class ReplyWrite implements ProjectService {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		ProjectDao pdao = Constant.pdao;
		String bId = request.getParameter("bId");
		String memName = request.getParameter("memName");
		String rContent = request.getParameter("rContent");
		String result = pdao.pCreateReply(bId, memName, rContent);
		System.out.println("리플 등록 : " + result);
		ProjectSelected dto = pdao.pReadOne(bId);
		request.setAttribute("prjSelected", dto);
	}

}
