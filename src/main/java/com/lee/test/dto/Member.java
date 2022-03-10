package com.lee.test.dto;

// db�� MEMBER ���̺��� Į����� ��ġ������ DTO ��ü

public class Member {
	// �������
	private String memId;
	private String memPw;
	private String memName;
	private String memPhoto;
	
	// ������
	public Member() {}

	public Member(String memId, String memPw, String memName, String memPhoto) {
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhoto = memPhoto;
	}
	
	// getter, setter �޼���
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
}
