package com.lee.test.dto;

// db의 MEMBER 테이블의 칼럼명과 일치시켜준 DTO 객체

public class Member {
	// 멤버변수
	private String memId;
	private String memPw;
	private String memName;
	private String memPhoto;
	
	// 생성자
	public Member() {}

	public Member(String memId, String memPw, String memName, String memPhoto) {
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhoto = memPhoto;
	}
	
	// getter, setter 메서드
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
