package com.GoalMate.www.DAO.Msg;

import java.util.List;

import com.GoalMate.www.DTO.MatchDTO;
import com.GoalMate.www.DTO.MsgDTO;

public interface MsgDAO {
	String sysdate();
	List<MsgDTO> msgList(int start,int end,String id);
	int msgList_count(String id);
	int msgdel(String num);
	int msgread(String num);
	MsgDTO msgDTO(String num);
	int msgInsert(String sender,String recipient,String content);
	int msgClub(String id);
	int msgMem(String id);
	MatchDTO msgMatDTO(String num);
	int msgAwayUpdate(String mat_away,String mat_num);
	int msgHomeUpdate(String mat_home,String mat_num);
	int msgLinkUpdate(String num);
}
