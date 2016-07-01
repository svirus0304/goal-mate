package com.GoalMate.www.DAO.Match;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.MatchDTO;
import com.GoalMate.www.DTO.StadiumDTO;

public class MatchDAOImp implements MatchDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MatchDTO>  cal_today(String today) {
		List<MatchDTO> list=sqlSession.selectList("cal_today", today);
		return list;
	}
	@Override
	public List<MatchDTO>  cal_thisMonth(Map<String, String> map) {
		List<MatchDTO> list=sqlSession.selectList("cal_thisMonth", map);
		return list;
	}
	@Override
	public List<MatchDTO>  cal_thisMonth_thisArea(Map<String, String> map) {
		List<MatchDTO> list=sqlSession.selectList("cal_thisMonth_thisArea", map);
		return list;
	}

	public List<String> getDays(Map<String, String> map) {
		String lastDate=(String)sqlSession.selectOne("getLastDate", map);
		int lastDay=Integer.parseInt(lastDate.substring(8, 10));
		List<String> days=new ArrayList<String>();
		for (int i = 0; i < lastDay; i++) {
			days.add((i+1)+"");
		}
		return days;
	}

	public List<String> getAreas() {
		String[] gu={"대구전체","중구", "동구", "서구", "남구", "달서구", "달성군", "북구", "수성구"};
		List<String> areas=new ArrayList<String>();
		for (int i = 0; i < gu.length; i++) {
			areas.add(gu[i]);
		}//for
		return areas;
	}

	public ClubDTO getClubDTObyId(String club_id) {
		ClubDTO clubDTO=(ClubDTO)sqlSession.selectOne("getClubDTObyId", club_id);
		return clubDTO;
	}

	public void challengeReg(MatchDTO dto) {
		sqlSession.insert("challengeReg", dto);		
	}

	public Map<String, String> dateCutter(String date) {
		Map<String, String> map_date=new HashMap<String, String>();
		String thisYear;
		String thisMonth;
		String today;
		if (date==null) {//첨들어왔을때
			System.out.println("date == null");
			date=new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
		}
		String[] dateArr=date.split("-");
		thisYear=dateArr[0];
		thisMonth=dateArr[1];
		today=dateArr[2];

		map_date.put("year", thisYear);
		map_date.put("month", thisMonth);
		map_date.put("day", today);
		return map_date;
	}

	public List<MatchDTO> matchUpList(String date) {
		List<MatchDTO> list=sqlSession.selectList("matchUpList", date);
		return list;
	}
	public List<MatchDTO> matchUpList(Map<String, String> map) {
		List<MatchDTO> list=sqlSession.selectList("matchUpList_area", map);
		return list;
	}

	public List<MatchDTO> matchUpSearch(Map<String, String> map) {
		List<MatchDTO> list=sqlSession.selectList("matchUpSearch",map);
		return list;
	}
	public ClubDTO getClubDTObyName(String club_name) {
		ClubDTO clubDTO=(ClubDTO)sqlSession.selectOne("getClubDTObyName", club_name);
		return clubDTO;
	}

	public MatchDTO getMatchDTO(String mat_num) {
		MatchDTO matchDTO=(MatchDTO)sqlSession.selectOne("getMatchDTO", mat_num);
		return matchDTO;
	}

	public int getMemberCnt(String club_id) {
		int memberCnt=(Integer)sqlSession.selectOne("getMemberCnt", club_id);
		return memberCnt;
	}

	public void challengeAskHome(Map<String, String> map) {
		sqlSession.update("challengeAskHome", map);
	}
	public void challengeAskAway(Map<String, String> map) {
		sqlSession.update("challengeAskAway", map);
	}

	public void sendChallengeMsg(Map<String, String> map_msg) {
		sqlSession.insert("sendChallengeMsg", map_msg);
	}

	public List<Mat_ReDTO> myMatch(String club_name) {
		List<Mat_ReDTO> list=sqlSession.selectList("myMatch",club_name);
		return list;
	}

	public List<Mat_ReDTO> getRe() {
		List<Mat_ReDTO> re_list=sqlSession.selectList("getRe");
		return re_list;
	}
	
	public Mat_ReDTO getMat_ReDTO(String mat_num) {
		Mat_ReDTO dto=(Mat_ReDTO) sqlSession.selectOne("getMat_ReDTO", mat_num);
		return dto;
	}

	public void reReg(Mat_ReDTO mat_reDTO) {
		sqlSession.insert("reReg", mat_reDTO);
	}

	public List<Mat_ReDTO> myMatchSearch(Map<String, String> map) {
		List<Mat_ReDTO> list=sqlSession.selectList("myMatchSearch",map);
		return list;
	}

	public List<StadiumDTO> getStadiumList() {
		List<StadiumDTO> stadiumList=sqlSession.selectList("getStadiumList");
		return stadiumList;
	}


}
