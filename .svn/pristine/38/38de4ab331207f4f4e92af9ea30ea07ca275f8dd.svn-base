package com.GoalMate.www.DAO.LogIO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class LogIoDAOImp implements LogIoDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setSqlSession()

	public int loginCheckMemberTable(String mem_id, String mem_pw) {//회원 로그인 시
		int result = 0;
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("mem_id", mem_id);
		hashMap.put("mem_pw", mem_pw);
		if (mem_id.equals("admin")) {//관리자 로그인 경우
			result = (Integer) sqlSession.selectOne("loginCheckMemberTable", hashMap);
			if (result<0) {//로그인 실패 시 result값만 반환 후 메소드 종료
				return result;
			}else if (result>0) {//로그인 성공 시 admin 구분을 위해 result값 조정
				result = 7;//컨트롤러에서 다시 값을 받았을때 admin을 인지하게 해주기 위해.. 7이라는 숫자는 아무 의미 없음
			}//else if
			
		}else {//일반회원 로그인 경우
			result = (Integer) sqlSession.selectOne("loginCheckMemberTable", hashMap);
			if (result<0) {//로그인 실패 시 result값만 반환 후 메소드 종료
				return result;
			}//if
		}//else
		
		return result;
	}//loginCheckMemberTable()

	public int loginCheckClubTable(String club_id, String club_pw) {//클럽 로그인 시
		int result = 0;
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("club_id", club_id);
		hashMap.put("club_pw", club_pw);
		result = (Integer) sqlSession.selectOne("loginCheckClubTable", hashMap);
		return result;
	}//loginCheckClubTable()
	
}//class
