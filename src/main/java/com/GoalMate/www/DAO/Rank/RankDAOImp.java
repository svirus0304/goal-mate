package com.GoalMate.www.DAO.Rank;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubDTO;

public class RankDAOImp implements RankDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public ArrayList<Integer> Player_list(List<ClubDTO> check) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		if(check!=null){
			for (int i = 0; i < check.size(); i++) {
				String club_id = check.get(i).getClub_id();
				int num;		
				num =(Integer) sqlSession.selectOne("player_count",club_id);
				list.add(num);					
			}
		}
		return list;
	}
	
	@Override
	public List<ClubDTO> list() {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("rank_list");
		return list;
	}

	@Override
	public List<ClubDTO> list_area(String areas) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("rank_list_area",areas);
		return list;
	}

	@Override
	public List<ClubDTO> list_type(String types) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("rank_list_type",types);
		return list;
	}

	@Override
	public List<ClubDTO> list_age(String ages) {
		List<ClubDTO> list = null;
		list= sqlSession.selectList("rank_list_age",ages);
		return list;
	}

	@Override
	public List<ClubDTO> list_area_type(String areas, String types) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("areas",areas);
		map.put("types",types);
		List<ClubDTO> list = null;
		list=sqlSession.selectList("rank_list_area_type",map);
		return list;
	}

	@Override
	public List<ClubDTO> list_area_age(String areas, String ages) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("areas",areas);
		map.put("ages",ages);
		List<ClubDTO> list = null;
		list=sqlSession.selectList("rank_list_area_age",map);
		return list;
	}

	@Override
	public List<ClubDTO> list_type_age(String types, String ages) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("types",types);
		map.put("ages",ages);
		List<ClubDTO> list = null;
		list=sqlSession.selectList("rank_list_type_age",map);
		return list;
	}

	@Override
	public List<ClubDTO> list_area_type_age(String areas, String types, String ages) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("areas",areas);
		map.put("types",types);
		map.put("ages",ages);
		List<ClubDTO> list = null;
		list=sqlSession.selectList("rank_list_area_type_age",map);
		return list;
	}
	
	
}
