package com.lee.test.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
// project 등록을 위한 게시물 DTO 클래스
public class Project {
	private int bId;
	private String bTitle;
	private String bName;
	private String bContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Timestamp bDate;
	private int bHit;
	private int bGroup;
	private String bPhoto;
	private String bGithub;
	
	public Project() {}

	public Project(int bId, String bTitle, String bName, String bContent, Timestamp bDate, int bHit, int bGroup,
			String bPhoto, String bGithub) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bName = bName;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bPhoto = bPhoto;
		this.bGithub = bGithub;
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

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
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

	public String getbGithub() {
		return bGithub;
	}

	public void setbGithub(String bGithub) {
		this.bGithub = bGithub;
	}
}
