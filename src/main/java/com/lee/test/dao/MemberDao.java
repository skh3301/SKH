package com.lee.test.dao;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lee.test.dto.Member;

public class MemberDao implements MemberIDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ȸ������
	@Override
	public String join(Member dto) {
		int res = sqlSession.insert("join", dto);
		if(res==1)
			System.out.println("ȸ������ ����");
		String result = null;
		if(res>0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
	// �α���
	@Override
	public Member login(String memId) {
		Member result = sqlSession.selectOne("login", memId);
		return result;
	}
	// ���̵� �ߺ�üũ
	@Override
	public int idChk(String memId) {
		int result =sqlSession.selectOne("idChk", memId);
		return result;
	}
	// �̸� �ߺ�üũ
	@Override
	public int nameChk(String memName) {
		int result = sqlSession.selectOne("nameChk", memName);
		return result;
	}

	
}
