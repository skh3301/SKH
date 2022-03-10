package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lee.test.dao.MemberDao;
import com.lee.test.dto.Member;
import com.lee.test.util.Constant;
@Service
public class MemberJoin implements MemberService {
	
	@Autowired
	MemberDao mdao;

	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		BCryptPasswordEncoder passwordEncoder= Constant.passwordEncoder;
		
		Member dto = (Member)request.getAttribute("dto");
		
		String original = dto.getMemPw();	// 암호화 전 memPw
		dto.setMemPw(passwordEncoder.encode(original));	// dto에 집어넣기
		
		mdao = Constant.mdao;
		
		String result = mdao.join(dto);
		
		model.addAttribute("result", result);
	}

}
