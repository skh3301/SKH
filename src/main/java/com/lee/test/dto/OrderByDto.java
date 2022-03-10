package com.lee.test.dto;

public class OrderByDto {
	private int group;
	private String orderBy;
	public OrderByDto(int group, String orderBy) {
		super();
		this.group = group;
		this.orderBy = orderBy;
	}
	public OrderByDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

}
