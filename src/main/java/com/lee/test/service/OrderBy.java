package com.lee.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lee.test.dao.ProjectDao;
import com.lee.test.dto.OrderByDto;
import com.lee.test.dto.ProjectList;
import com.lee.test.util.Constant;

public class OrderBy implements ProjectService {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		String group = request.getParameter("group");
		String orderBy = request.getParameter("orderBy");
		ProjectDao pdao = Constant.pdao;
		ArrayList<ProjectList> dtos = pdao.pReadListOrderBy(group, orderBy);
		for(int i = 0; i <dtos.size(); i++) {
			System.out.println(dtos.get(i).getbTitle());
		}
		request.setAttribute("projectList", dtos);
	}

}
