package com.GoalMate.www.DAO.Score;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.BannerDTO;
import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.ScoreDTO;


public class ScoreDAOImp implements ScoreDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Mat_ReDTO> scoreList() {
		List<Mat_ReDTO> list=sqlSession.selectList("scoreList");
		return list;
	}//scoreList()

	@Override
	public Mat_ReDTO mat_reDTO(int mat_num) {
		Mat_ReDTO mat_reDTO=(Mat_ReDTO) sqlSession.selectOne("mat_reDTO", mat_num);
		return mat_reDTO;
	}

	@Override
	public ClubDTO clubDTO(String clubName) {
		ClubDTO clubDTO=(ClubDTO) sqlSession.selectOne("clubDTO", clubName);
		return clubDTO;
	}

	@Override
	public void scoreConfirm(String mat_num) {
		int sel=sqlSession.update("scoreConfirm", mat_num);
		System.out.println("scoreConfirm - sel : "+sel);
	}

	@Override
	public List<Mat_ReDTO> scoreSearch(String name) {
		List<Mat_ReDTO> list=sqlSession.selectList("scoreSearch", name);
		return list;
	}


	
//	@Override
////public void firstInput(MallDTO dto){
////	int sel=sqlSession.insert("firstInput", dto);
////}//join
////
////@Override
////public void input(MallDTO dto){
////	int sel=sqlSession.insert("input", dto);
////}//join
////
//@Override
//public int loginCheck(MemberDTO dto) {
//	int sel = 0;
//	sel=(Integer)sqlSession.selectOne("member_loginCheck", dto);
//	return sel;
//}//loginCheck
//////
//@Override
//public List<GoodsDTO> prodList() {
//	List<GoodsDTO> list=sqlSession.selectList("goods_prodList");
//	return list;
//}//memlist
//////
//////@Override
//////public void delete(String stdnum) {
//////	int sel=sqlSession.delete("delete",stdnum);
//////}//delete
////////
////@Override
////public MallDTO boardView(String board_num) {
////	MallDTO dto=(MallDTO)sqlSession.selectOne("boardView", board_num);
////	return dto;
////}//updateform
////
//////
////@Override
////public void mkRoom4re(String origSeq) {
////	int sel=sqlSession.update("mkRoom4re", origSeq);	
////}//update
////
////@Override
////public void reInput(MallDTO dto){
////	int sel=sqlSession.insert("reInput", dto);
////}//join
////
////@Override
////public void readcount(String board_num) {
////	int sel=sqlSession.update("readcount", board_num);	
////}
////
//////@Override
//////public void modify(BoardDTO dto) {
//////	int sel=sqlSession.update("modify", dto);
//////	System.out.println("modify - sel : "+sel);
//////}//update
//@Override
//public void prodReg(GoodsDTO dto) {
//	int sel=sqlSession.insert("goods_prodReg", dto);
//	System.out.println("prodReg - sel : "+sel);
}
