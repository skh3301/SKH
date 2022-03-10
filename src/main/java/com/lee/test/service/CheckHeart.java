package com.lee.test.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.lee.test.dao.ProjectDao;
import com.lee.test.dto.ProjectSelectedCount;
import com.lee.test.dto.UpHeartResult;
import com.lee.test.util.Constant;

public class CheckHeart implements ProjectService {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		ProjectDao pdao = Constant.pdao;
		String bId = request.getParameter("bId");
		String memName = request.getParameter("memName");
		String result = pdao.pCheckHeart(bId, memName);
		Boolean check;
		if(result.equals("okay")) {
			check = true;	// 중복 없다 = 실행한다
			pdao.upHeart(bId, memName);
		} else {
			check = false;
		}
		ProjectSelectedCount count = pdao.pReadCount(bId);
		UpHeartResult dto = new UpHeartResult(check, count);
		request.setAttribute("heartResult", dto);
	}
}
