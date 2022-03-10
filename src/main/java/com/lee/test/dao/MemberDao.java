package com.lee.test.dao;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lee.test.dto.Member;

public class MemberDao implements MemberIDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public String join(Member dto) {
		int res = sqlSession.insert("join", dto);
		if(res==1)
			System.out.println("회원가입 성공");
		String result = null;
		if(res>0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
	// 로그인
	@Override
	public Member login(String memId) {
		Member result = sqlSession.selectOne("login", memId);
		return result;
	}
	// 아이디 중복체크
	@Override
	public int idChk(String memId) {
		int result =sqlSession.selectOne("idChk", memId);
		return result;
	}
	// 이름 중복체크
	@Override
	public int nameChk(String memName) {
		int result = sqlSession.selectOne("nameChk", memName);
		return result;
	}

	
}
