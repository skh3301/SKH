package com.lee.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.lee.test.dto.Heart;
import com.lee.test.dto.OrderByDto;
import com.lee.test.dto.Project;
import com.lee.test.dto.ProjectList;
import com.lee.test.dto.ProjectSelected;
import com.lee.test.dto.ProjectSelectedCount;
import com.lee.test.dto.Reply;
import com.lee.test.dto.ReplyDto;

public class ProjectDao implements ProjectIDao {
	@Autowired
	private SqlSession sqlSession;
	
	// ========== Project �Խù� ==========
		// ========== Create(���) ==========
	@Override
	public String pCreate(String bTitle, String bName, String bContent, int bGroup, String bPhoto, String bGithub) {
		Project dto = new Project(0, bTitle, bName, bContent, null, 0, bGroup, bPhoto, bGithub);
		int result = sqlSession.insert("pCreate",dto);
		String res;
		if(result == 1) {
			res = "success";
		}
		else
			res = "failed";
		return res;
	}
		// ========== Read(��ȸ) ��� ��ȯ ==========
	@Override
	public ArrayList<ProjectList> pReadList(int i) {
		ArrayList<ProjectList> result;
		switch(i) {
		case 1: result = (ArrayList)sqlSession.selectList("pReadList1");
			break;
		case 2: result = (ArrayList)sqlSession.selectList("pReadList2");
			break;
		case 3: result = (ArrayList)sqlSession.selectList("pReadList3");
			break;
		default : result = (ArrayList)sqlSession.selectList("pReadListAll");
		}
		return result;
	}
		// ========== Read(��ȸ) Ư�� �Խù� ��ȯ ==========
	@Override
	public ProjectSelected pReadOne(String bId) {
		int idNum = Integer.parseInt(bId);
		upHit(bId);	// ��ȸ�� �� ��Ű��
		ProjectSelectedCount count = pReadCount(bId);	// ���ƿ�, ��ȸ��, ���� �� ��������
		Project prj = sqlSession.selectOne("pReadOne", idNum);	// �Խù� �ϳ� ���� ��������
		ArrayList<Reply> reply = pReadReplyList(bId);	// ���� ��� ��������
		ProjectSelected result = new ProjectSelected(prj, count, reply);
		System.out.println("dao ���");
		return result;
	}
		// ========== ��ȸ�� �� ==========
	@Override
	public void upHit(String bId) {
		int idNum = Integer.parseInt(bId);
		sqlSession.update("upHit", idNum);
	}
		// ========== ���ƿ�, ��ȸ��, ���ü� �������� ==========
	@Override
	public ProjectSelectedCount pReadCount(String bId) {
		int idNum = Integer.parseInt(bId);
		ProjectSelectedCount count = sqlSession.selectOne("pReadCount", idNum);
		return count;
	}
		// ========== ���� ��� �������� ==========
	@Override
	public ArrayList<Reply> pReadReplyList(String bId) {
		int idNum = Integer.parseInt(bId);
		ArrayList<Reply> result = (ArrayList)sqlSession.selectList("pReadReplyList",idNum);
		return result;
	}
	
		// ========== ���� ����ϱ� ==========
	@Override
	public String pCreateReply(String bId, String memName, String rContent) {
		int bIdNum = Integer.parseInt(bId);
		ReplyDto dto = new ReplyDto(0, bIdNum, memName, rContent, null);
		int result = sqlSession.insert("pCreateReply",dto);
		String res;
		if(result == 1) {
			res = "success";
		}
		else
			res = "failed";
		return res;
	}
		// ========== ��Ʈ �ߺ� Ȯ���ϱ� ==========
	@Override
	public String pCheckHeart(String bId, String memName) {
		int bIdNum = Integer.parseInt(bId);
		Heart dto = new Heart(0, bIdNum, memName);
		Heart result = sqlSession.selectOne("pCheckHeart", dto);
		String res;
		if(result==null) {
			res = "okay";
		} else
			res = "no";
		return res;
	}
		// ========== ��Ʈ �� ==========
	@Override
	public void upHeart(String bId, String memName) {
		int bIdNum = Integer.parseInt(bId);
		Heart dto = new Heart(0, bIdNum, memName);
		int result = sqlSession.insert("upHeart", dto);
		if(result==1)
			System.out.println("��Ʈ �� ����");
	}
	
		// ========== �Խù� ��ȸ ���� ==========
	@Override
	public ArrayList<ProjectList> pReadListOrderBy(String group, String orderBy) {
		int groupNum = Integer.parseInt(group);
		OrderByDto dto = new OrderByDto(groupNum, orderBy);
		ArrayList<ProjectList> result = (ArrayList)sqlSession.selectList("pReadListOrderBy", dto);
		System.out.println("���� �Ϸ� : (" + dto.getGroup() + "�׷�) & (" + dto.getOrderBy() + "����)");
		return result;
	}
		// ========== �Խù� ã�� ==========
	@Override
	public ArrayList<ProjectList> pReadSearchList(String title) {
		ArrayList<ProjectList> result;
		result = (ArrayList)sqlSession.selectList("pReadSearchList", title);
		return result;
	}
}
