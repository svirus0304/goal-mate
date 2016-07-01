package com.GoalMate.www.DAO.ClubMem;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.MemDTO;
import com.GoalMate.www.DTO.PlayerDTO;

public class ClubMemDAOImp implements ClubMemDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int memIdChecks(String club_id) {
		String mem_id = club_id;
		int check = 0;
		check = (Integer) sqlSession.selectOne("memIdChecks", mem_id);
		return check;
	}//idCheck()

	public int clubIdChecks(String club_id) {		
		int check = 0;
		check = (Integer) sqlSession.selectOne("clubIdChecks", club_id);
		return check;
	}//clubIdCheck()

	public int clubNameCheck(String club_name) {
		int check = 0;
		check = (Integer) sqlSession.selectOne("clubNameCheck", club_name);
		return check;
	}//clubNameCheck()

	public int clubJoin(ClubDTO dto) {
		int resultVal = 0;
		resultVal = sqlSession.insert("clubJoin", dto);
		return resultVal;
	}//changeClubPic()

	public ClubDTO bringClubInfo(String club_id) {
		ClubDTO dto = null;
		dto = (ClubDTO)sqlSession.selectOne("bringClubInfo", club_id);
		return dto;
	}//bringClubInfo()

	public int changeClubPic(ClubDTO dto) {
		int resultVal = sqlSession.update("changeClubPic", dto);
		return resultVal;
	}//changeClubPic()
	
	public int clubChangePassword(ClubDTO dto) {
		int resultVal = 0;
		resultVal= sqlSession.update("clubChangePassword",dto);
		return resultVal;
	}//clubchangePassword()

	public int clubChangeInfo(ClubDTO dto) {
		int resultVal = 0;
		resultVal= sqlSession.update("clubChangeInfo",dto);
		return resultVal;
	}//clubChangeInfo()
	
	public List<PlayerDTO> bringClubMemberInfoList(String club_id) {//클럽멤버 정보가져오는 메소드
		List<PlayerDTO> list = null;
		list = (List<PlayerDTO>)sqlSession.selectList("bringClubMemberInfoList", club_id);
		return list;
	}//bringClubMemberInfoList()

	public void deletePlayers(String deletePlayers) {
		sqlSession.delete("deletePlayers", deletePlayers);
	}//deletePlayers()

	public void deletePlayer(String num) {
		sqlSession.delete("deletePlayer", num);
	}//deletePlayer()

	public void clubMemberAdd(PlayerDTO dto) {
		sqlSession.insert("clubMemberAdd", dto);
	}

	public PlayerDTO clubMemberInfo(String num) {
		String pl_num = num;
		PlayerDTO dto = null;
		dto = (PlayerDTO)sqlSession.selectOne("clubMemberInfo", pl_num);
		return dto;
	}

	public void clubMemberModify(PlayerDTO dto) {
		sqlSession.update("clubMemberModify", dto);
	}



	
	
}
