package com.GoalMate.www.DAO.Stadium;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.StadiumDTO;

public class StaDAOImp implements StadiumDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<StadiumDTO> staList() {
		List<StadiumDTO>list = sqlSession.selectList("staList");
		return list;
	}
	@Override
	public StadiumDTO staDetailList(String st_num) {
		StadiumDTO staDTO = (StadiumDTO) sqlSession.selectOne("staDetail", st_num);
		return staDTO;
	}

	public List<StadiumDTO> middleList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("middle", st_area);
		return list;
	}

	public List<StadiumDTO> westList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("west", st_area);
		return list;
	}

	public List<StadiumDTO> southList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("south", st_area);
		return list;
	}

	public List<StadiumDTO> dalseoList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("dalseo", st_area);
		return list;
	}

	public List<StadiumDTO> northList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("north", st_area);
		return list;
	}

	public List<StadiumDTO> eastList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("east", st_area);
		return list;
	}

	public List<StadiumDTO> dalsungList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("dalsung", st_area);
		return list;
	}

	public List<StadiumDTO> suseongList(String st_area) {
		List<StadiumDTO>list = sqlSession.selectList("suseong", st_area);
		return list;
	}

	
}
