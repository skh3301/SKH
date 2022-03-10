package com.lee.test.dao;

import java.util.ArrayList;

import com.lee.test.dto.OrderByDto;
import com.lee.test.dto.ProjectList;
import com.lee.test.dto.ProjectSelected;
import com.lee.test.dto.ProjectSelectedCount;
import com.lee.test.dto.Reply;

public interface ProjectIDao {
	// 게시물 등록
	public String pCreate(String bTitle, String bName, String bContent, int bGroup, String bPhoto, String bGithub);
	
	// 게시물 리스트 조회
	public ArrayList<ProjectList> pReadList(int i);
	
	// 선택된 게시물 하나 조회
	public ProjectSelected pReadOne(String bId);
	
	// 게시물 선택시 upHit
	public void upHit(String bId);
	
	// 선택된 게시물 하나의 좋아요, 조회수, 리플수 가져오기
	public ProjectSelectedCount pReadCount(String bId);
	
	// 리플 목록 가져오기
	public ArrayList<Reply> pReadReplyList(String bId);
	
	// 리플 등록하기
	public String pCreateReply(String bId, String memName, String rContent);
	
	// 하트 중복 확인하기
	public String pCheckHeart(String bId, String memName);
	
	// 하트 업
	public void upHeart(String bId, String memName);
	
	// 게시물 조회 순서
	public ArrayList<ProjectList> pReadListOrderBy(String group, String orderBy);
	
	// 게시물 찾기
	public ArrayList<ProjectList> pReadSearchList(String title);
}
