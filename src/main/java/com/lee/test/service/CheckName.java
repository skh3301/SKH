package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.lee.test.dao.MemberDao;
import com.lee.test.util.Constant;

public class CheckName implements MemberService {
	
	@Autowired
	MemberDao mdao;

	@Override
	public void execute(Model model, HttpServletRequest request) {
		mdao = Constant.mdao;
		String memName = request.getParameter("memName");
		int result = mdao.nameChk(memName);
		request.setAttribute("checkingName", result);
	}
}
