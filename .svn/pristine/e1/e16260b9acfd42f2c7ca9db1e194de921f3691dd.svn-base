package com.GoalMate.www.DAO.Mem;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.MemDTO;

public class MemDAOImp implements MemDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int memIdCheck(String mem_id) {
		int check = 0;
		check = (Integer) sqlSession.selectOne("memIdCheck", mem_id);
		return check;
	}//idCheck()

	public int clubIdCheck(String mem_id) {
		String club_id = mem_id;
		int check = 0;
		check = (Integer) sqlSession.selectOne("clubIdCheck", club_id);
		return check;
	}//clubIdCheck()

	public int memJoin(MemDTO dto) {
		int resultVal = 0;
		dto.setMem_used("0");//회원  계정을 쓰는지 안쓰는지 구분하기 위해 씀
		if (dto.getMem_path()==null) {//회원사진을 넣지 않았을 경우 기본이미지를 넣어준다.
			dto.setMem_path("Mem_default.jpg");
		}//if
		resultVal = sqlSession.insert("memJoin", dto);
		return resultVal;
	}//clubIdCheck

	public MemDTO bringMemberInfo(String mem_id) {
		MemDTO dto = null;
		System.out.println("멤 아이디 없냐?"+mem_id);
		dto =  (MemDTO)sqlSession.selectOne("bringMemberInfo", mem_id);
		return dto;
	}//bringMemberInfo()

	public int memchangePassword(MemDTO dto) {
		int resultVal = 0;
		resultVal= sqlSession.update("memChangePassword",dto);
		return resultVal;
	}//memchangePassword()

	public int changePic(MemDTO dto) {
		int resultVal = sqlSession.update("changePic", dto);
		return resultVal;
	}
	
	
}//class
