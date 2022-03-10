package com.lee.test.dto;

import java.sql.Timestamp;

public class ReplyDto {
	private int rId;
	private int bId;
	private String memName;
	private String rContent;
	private Timestamp rDate;
	public ReplyDto() {
	}
	public ReplyDto(int rId, int bId, String memName, String rContent, Timestamp rDate) {
		super();
		this.rId = rId;
		this.bId = bId;
		this.memName = memName;
		this.rContent = rContent;
		this.rDate = rDate;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
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
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
}
