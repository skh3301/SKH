package com.lee.test.dto;

import java.sql.Timestamp;

public class ProjectList {
	// 게시물 목록 출력을 위한 DTO 클래스
	private int bId;
	private String bTitle;
	private String bName;
	private String bContent;
	private Timestamp bDate;
	private int bGroup;
	private String bPhoto;
	private int bHit;
	private int bReply;
	private int bHeart;
	
	public ProjectList() {}

	public ProjectList(int bId, String bTitle, String bName, String bContent, Timestamp bDate, int bGroup,
			String bPhoto, int bHit, int bReply, int bHeart) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bName = bName;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bGroup = bGroup;
		this.bPhoto = bPhoto;
		this.bHit = bHit;
		this.bReply = bReply;
		this.bHeart = bHeart;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getbGroup() {
		return bGroup;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}

	public String getbPhoto() {
		return bPhoto;
	}

	public void setbPhoto(String bPhoto) {
		this.bPhoto = bPhoto;
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

	public int getbHeart() {
		return bHeart;
	}

	public void setbHeart(int bHeart) {
		this.bHeart = bHeart;
	}
}
