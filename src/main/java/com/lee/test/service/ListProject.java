package com.lee.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lee.test.dao.ProjectDao;
import com.lee.test.dto.ProjectList;
import com.lee.test.util.Constant;

public class ListProject implements ProjectService {
	private int pCode;
	public ListProject(int pCode) {
		this.pCode = pCode;
	}
	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		ProjectDao pdao = Constant.pdao;
		ArrayList<ProjectList> dtos = pdao.pReadList(pCode);
		request.setAttribute("projectList", dtos);
	}
}
