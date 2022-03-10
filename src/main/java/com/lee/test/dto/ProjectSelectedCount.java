package com.lee.test.dto;

public class ProjectSelectedCount {
	private int bHeart;
	private int bHit;
	private int bReply;
	
	public ProjectSelectedCount() {
		super();
	}

	public ProjectSelectedCount(int bHeart, int bHit, int bReply) {
		this.bHeart = bHeart;
		this.bHit = bHit;
		this.bReply = bReply;
	}
	public int getbHeart() {
		return bHeart;
	}
	public void setbHeart(int bHeart) {
		this.bHeart = bHeart;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbReply() {
		return bReply;
	}
	public void setbReply(int bReply) {
		this.bReply = bReply;
	}
}
