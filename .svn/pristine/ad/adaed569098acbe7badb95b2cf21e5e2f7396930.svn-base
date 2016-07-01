package com.GoalMate.www.DAO.Club;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.PlayerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class ClubDAOImp implements ClubDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ClubDTO> list() {
	    List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list");
		return list;
	}
	public List<ClubDTO> listPage(int start,int end) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_page",map);
		return list;
	}

	@Override
	public List<ClubDTO> list_age(String age) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_age",age);
		return list;
	}
	@Override
	public List<ClubDTO> list_age_Page(int start, int end, String age) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("age", age);
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_age_page",map);
		return list;
	}


	@Override
	public List<ClubDTO> list_club(String finds) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_club",finds);
		return list;
	}
	@Override
	public List<ClubDTO> list_club_Page(int start, int end, String finds) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("finds", finds);
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_club_page",map);
		return list;
	}

	public List<ClubDTO> list_area(String finds) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_area",finds);
		return list;
	}
	
	@Override
	public List<ClubDTO> list_area_Page(int start, int end, String finds) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("finds", finds);
		List<ClubDTO> list = null;
		list= sqlSession.selectList("club_list_area_page",map);
		return list;
	}

	@Override
	public ClubDTO findClub(String club_id) {
		ClubDTO dto = new ClubDTO();
		dto = (ClubDTO) sqlSession.selectOne("club_one",club_id);
		return dto;
	}

	@Override
	public List<PlayerDTO> list_player(String club_id) {
		List<PlayerDTO> list = null;
		list = sqlSession.selectList("list_player",club_id);
		return list;
	}




	

	
	
}
