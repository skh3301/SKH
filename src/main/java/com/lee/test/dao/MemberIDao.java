package com.lee.test.dao;

import com.lee.test.dto.Member;

public interface MemberIDao {
	// 회원가입
	public String join(Member member);
	
	// 로그인
	public Member login(String memId);
	
	// 아이디 중복체크
	public int idChk(String memId);
	
	// 이름 중복체크
	public int nameChk(String memName);
	
}
