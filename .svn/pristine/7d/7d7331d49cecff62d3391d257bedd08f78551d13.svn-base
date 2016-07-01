package com.GoalMate.www.DAO.Msg;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.MatchDTO;
import com.GoalMate.www.DTO.MsgDTO;

public class MsgDAOImp implements MsgDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String sysdate() {
		String sysdate;
		sysdate=(String) sqlSession.selectOne("sysdate");
		return sysdate;
	}

	@Override
	public List<MsgDTO> msgList(int start,int end,String id) {
		List<MsgDTO> list =null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("id", id);
		list = sqlSession.selectList("msglist",map);
		return list;
	}

	@Override
	public int msgList_count(String id) {
		int count=0;
		count= (Integer) sqlSession.selectOne("msglist_count",id);
		return count;
	}

	@Override
	public int msgdel(String num) {
		 return sqlSession.update("delUpdate",num);
	}

	@Override
	public int msgread(String num) {
		return sqlSession.update("readUpdate",num);
	}

	@Override
	public MsgDTO msgDTO(String num) {
		return (MsgDTO) sqlSession.selectOne("msgone",num);
	}

	@Override
	public int msgInsert(String sender, String recipient, String content) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("sender",sender);
		map.put("recipient",recipient);
		map.put("content",content);
		int count = sqlSession.insert("msgInsert",map);
		return count;
	}

	@Override
	public int msgClub(String ids) {
		int check=0;
		check =(Integer)sqlSession.selectOne("msg_club",ids);
		return check;
	}

	@Override
	public int msgMem(String ids) {
		int check=0;
		check = (Integer)sqlSession.selectOne("msg_mem", ids);
		return check;
	}

	@Override
	public MatchDTO msgMatDTO(String mat_num) {
		MatchDTO dto = null;
		System.out.println("테스트"+mat_num);
		dto = (MatchDTO) sqlSession.selectOne("getMatchDTO",mat_num);
		return dto;
	}

	@Override
	public int msgAwayUpdate(String mat_away, String mat_num) {
		int check=0;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("club_name",mat_away);
		map.put("mat_num",mat_num);
		check = sqlSession.update("challengeAskAway",map);
		return check;
	}

	@Override
	public int msgHomeUpdate(String mat_home, String mat_num) {
		int check=0;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("club_name",mat_home);
		map.put("mat_num",mat_num);
		check = sqlSession.update("challengeAskHome",map);
		return check;
	}

	@Override
	public int msgLinkUpdate(String num) {
		int check=0;
		check=sqlSession.update("msgLinkUpdate",num);
		return check;
	}
	
	
}
