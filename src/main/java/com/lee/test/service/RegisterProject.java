package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lee.test.dao.ProjectDao;
import com.lee.test.util.Constant;
@Service
public class RegisterProject implements ProjectService {
	
	@Autowired
	ProjectDao pdao = Constant.pdao;
	
	@Override
	public void execute(Model model, HttpServletRequest request) {
		String bTitle = request.getParameter("bTitle");
		String bName = request.getParameter("bName");
		String bContent = request.getParameter("bContent");
		int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		String bPhoto = (String) request.getAttribute("bPhoto");
		String bGithub = request.getParameter("bGithub");
		System.out.println(bTitle + " " + bName + " " + bContent + " " + bPhoto + " " + bGithub);
		
		String result = pdao.pCreate(bTitle, bName, bContent, bGroup, bPhoto, bGithub);
		
		model.addAttribute("result",result);
		
	}
}
