package com.lee.test.dto;

public class Heart {
	private int hNo;
	private int bId;
	private String memName;
	public Heart() {}
	public Heart(int hNo, int bId, String memName) {
		this.hNo = hNo;
		this.bId = bId;
		this.memName = memName;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
}
