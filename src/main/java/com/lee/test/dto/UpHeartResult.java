package com.lee.test.dto;

public class UpHeartResult {
	private boolean checkHeart;
	private ProjectSelectedCount count;
	
	public UpHeartResult() {}
	public UpHeartResult(boolean checkHeart, ProjectSelectedCount count) {
		this.checkHeart = checkHeart;
		this.count = count;
	}
	public boolean isCheckHeart() {
		return checkHeart;
	}
	public void setCheckHeart(boolean checkHeart) {
		this.checkHeart = checkHeart;
	}
	public ProjectSelectedCount getCount() {
		return count;
	}
	public void setCount(ProjectSelectedCount count) {
		this.count = count;
	}
}
