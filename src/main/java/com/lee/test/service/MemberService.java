package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	
	public void execute(Model model,HttpServletRequest request); 
	
}
