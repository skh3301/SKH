package com.lee.test.dto;

import java.util.ArrayList;

public class ProjectSelected {
	private Project project;
	private ProjectSelectedCount count;
	private ArrayList<Reply> reply;
	
	public ProjectSelected() {}

	public ProjectSelected(Project project, ProjectSelectedCount count, ArrayList<Reply> reply) {
		this.project = project;
		this.count = count;
		this.reply = reply;
	}

	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public ProjectSelectedCount getCount() {
		return count;
	}
	public void setCount(ProjectSelectedCount count) {
		this.count = count;
	}
	public ArrayList<Reply> getReply() {
		return reply;
	}
	public void setReply(ArrayList<Reply> reply) {
		this.reply = reply;
	}	
}
