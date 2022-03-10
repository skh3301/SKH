package com.lee.test.dao;

import java.util.ArrayList;

import com.lee.test.dto.OrderByDto;
import com.lee.test.dto.ProjectList;
import com.lee.test.dto.ProjectSelected;
import com.lee.test.dto.ProjectSelectedCount;
import com.lee.test.dto.Reply;

public interface ProjectIDao {
	// �Խù� ���
	public String pCreate(String bTitle, String bName, String bContent, int bGroup, String bPhoto, String bGithub);
	
	// �Խù� ����Ʈ ��ȸ
	public ArrayList<ProjectList> pReadList(int i);
	
	// ���õ� �Խù� �ϳ� ��ȸ
	public ProjectSelected pReadOne(String bId);
	
	// �Խù� ���ý� upHit
	public void upHit(String bId);
	
	// ���õ� �Խù� �ϳ��� ���ƿ�, ��ȸ��, ���ü� ��������
	public ProjectSelectedCount pReadCount(String bId);
	
	// ���� ��� ��������
	public ArrayList<Reply> pReadReplyList(String bId);
	
	// ���� ����ϱ�
	public String pCreateReply(String bId, String memName, String rContent);
	
	// ��Ʈ �ߺ� Ȯ���ϱ�
	public String pCheckHeart(String bId, String memName);
	
	// ��Ʈ ��
	public void upHeart(String bId, String memName);
	
	// �Խù� ��ȸ ����
	public ArrayList<ProjectList> pReadListOrderBy(String group, String orderBy);
	
	// �Խù� ã��
	public ArrayList<ProjectList> pReadSearchList(String title);
}
