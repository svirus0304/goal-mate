package com.GoalMate.www.DAO.Score;

import java.util.List;

import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.ScoreDTO;

public interface ScoreDAO {

//	int loginCheck(MemberDTO dto);
//	void firstInput(MallDTO dto);
//	void input(MallDTO dto);
//	List<GoodsDTO> prodList();
//	void prodReg(GoodsDTO dto);
//	void readcount(String board_num);
//	MallDTO boardView(String board_num);
//	void mkRoom4re(String origSeq);
//	void reInput(MallDTO dto);
//	void modify(BoardDTO dto);
//	void delete(String stdnum);
	List<Mat_ReDTO> scoreList();
	Mat_ReDTO mat_reDTO(int mat_num);
	ClubDTO clubDTO(String clubName);
	void scoreConfirm(String mat_num);
	List<Mat_ReDTO> scoreSearch(String name);
	
	
}