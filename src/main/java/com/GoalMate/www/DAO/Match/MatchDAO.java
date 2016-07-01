package com.GoalMate.www.DAO.Match;

import java.util.List;
import java.util.Map;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.MatchDTO;
import com.GoalMate.www.DTO.StadiumDTO;

public interface MatchDAO {

	List<MatchDTO>  cal_today(String today);
	List<MatchDTO>  cal_thisMonth(Map<String, String> map);
	List<MatchDTO>  cal_thisMonth_thisArea(Map<String, String> map);
	List<String> getDays(Map<String, String> map);
	List<String> getAreas();
	Map<String, String> dateCutter(String date);
	ClubDTO getClubDTObyId(String club_id);
	void challengeReg(MatchDTO dto);
	List<MatchDTO> matchUpList(String date);
	List<MatchDTO> matchUpList(Map<String, String> map);
	List<MatchDTO> matchUpSearch(Map<String, String> map);
	ClubDTO getClubDTObyName(String club_name);
	MatchDTO getMatchDTO(String mat_num);
	int getMemberCnt(String club_id);
	void challengeAskHome(Map<String, String> map);
	void challengeAskAway(Map<String, String> map);
	void sendChallengeMsg(Map<String, String> map_msg);
	List<Mat_ReDTO> myMatch(String club_name);
	List<Mat_ReDTO> getRe();
	Mat_ReDTO getMat_ReDTO(String mat_num);
	void reReg(Mat_ReDTO mat_reDTO);
	List<Mat_ReDTO> myMatchSearch(Map<String, String> map);
	List<StadiumDTO> getStadiumList();
}
