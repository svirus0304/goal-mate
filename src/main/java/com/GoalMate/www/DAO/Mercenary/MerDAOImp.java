package com.GoalMate.www.DAO.Mercenary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.MercenaryDTO;

public class MerDAOImp implements MercenaryDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MercenaryDTO> listPage(int start, int end) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		List<MercenaryDTO> list = null;
		list=sqlSession.selectList("mer_list_page",map);
		return list;
	}

	@Override
	public int listPageAll() {
		int count=0;
		count=(Integer) sqlSession.selectOne("mer_list_pageAll");
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_area_position_foot(int start, int end, String cat1, String cat2, String cat3) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("areas",cat1);
		map.put("positions",cat2);
		map.put("foots",cat3);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_area_position_foot",map);
		return list;
	}

	@Override
	public int listPageAll_area_position_foot(String cat1, String cat2, String cat3) {
		int count=0;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("areas",cat1);
		map.put("positions",cat2);
		map.put("foots",cat3);
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_area_position_foot",map);
		return count;
	}

	@Override
	public int listPageAll_area_position(String cat1, String cat2) {
		int count=0;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("areas",cat1);
		map.put("positions",cat2);
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_area_position",map);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_area_position(int start, int end, String cat1, String cat2) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("areas",cat1);
		map.put("positions",cat2);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_area_position",map);
		return list;
	}

	@Override
	public int listPageAll_area_foot(String cat1, String cat3) {
		int count=0;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("areas",cat1);
		map.put("foots",cat3);
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_area_foot",map);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_area_foot(int start, int end, String cat1, String cat3) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("areas",cat1);
		map.put("foots",cat3);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_area_foot",map);
		return list;
	}

	@Override
	public int listPageAll_position_foot(String cat2, String cat3) {
		int count=0;
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("positions",cat2);
		map.put("foots",cat3);
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_position_foot",map);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_position_foot(int start, int end, String cat2, String cat3) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("positions",cat2);
		map.put("foots",cat3);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_position_foot",map);
		return list;
	}

	@Override
	public int listPageAll_area(String areas) {
		int count=0;
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_area",areas);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_area(int start, int end, String cat1) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("areas",cat1);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_area",map);
		return list;
	}

	@Override
	public int listPageAll_position(String positions) {
		int count=0;
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_position",positions);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_position(int start, int end, String cat2) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("positions",cat2);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_position",map);
		return list;
	}

	@Override
	public int listPageAll_foot(String foots) {
		int count=0;
		count=(Integer) sqlSession.selectOne("mer_list_pageAll_foot",foots);
		return count;
	}

	@Override
	public List<MercenaryDTO> listPage_foot(int start, int end, String cat3) {
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("start",String.valueOf(start));
		map.put("end",String.valueOf(end));
		map.put("foots",cat3);
		List<MercenaryDTO> list = null;
		list = sqlSession.selectList("mer_list_page_foot",map);
		return list;	
		}

	@Override
	public MercenaryDTO details(String mer_id) {
		MercenaryDTO dto = new MercenaryDTO();
		dto = (MercenaryDTO) sqlSession.selectOne("mer_detail",mer_id);
		return dto;
	}

	@Override
	public int MercenaryInsert(MercenaryDTO dto) {
		int check = 0;
		check = sqlSession.insert("merInsert",dto);
		return check;
	}

	@Override
	public int MercenaryIdCheck(String id) {
		int check = 0;
		check = (Integer) sqlSession.selectOne("mer_check_id",id);
		return check;
	}

	@Override
	public int MercenaryDelte(String id) {
		int check = 0;
		check = (Integer) sqlSession.delete("merDelete", id);
		return check;
	}

	@Override
	public int MercenaryUpdate(MercenaryDTO dto) {
		int check = 0;
		check = sqlSession.update("merUpdate",dto);
		return 0;
	}

	


	
	
	
}
