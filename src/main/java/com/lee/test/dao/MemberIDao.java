package com.lee.test.dao;

import com.lee.test.dto.Member;

public interface MemberIDao {
	// ȸ������
	public String join(Member member);
	
	// �α���
	public Member login(String memId);
	
	// ���̵� �ߺ�üũ
	public int idChk(String memId);
	
	// �̸� �ߺ�üũ
	public int nameChk(String memName);
	
}
