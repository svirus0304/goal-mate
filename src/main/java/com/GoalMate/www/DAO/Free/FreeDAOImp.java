package com.GoalMate.www.DAO.Free;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.FreeCommenDTO;
import com.GoalMate.www.DTO.FreeDTO;
import com.GoalMate.www.DTO.NoCommenDTO;
import com.GoalMate.www.DTO.NoticeDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.SearchFreeDTO;

public class FreeDAOImp implements FreeDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int bringFreeTotalCount() {
		int totalCount=0;
		totalCount = (Integer)sqlSession.selectOne("bringFreeTotalCount");
		return totalCount;
	}//bringFreeTotalCount()

	public List<FreeDTO> bringFreeList(PagingDTO pagingDTO) {
		List<FreeDTO> list = null;
		list = (List<FreeDTO>)sqlSession.selectList("bringFreeList",pagingDTO);
		return list;
	}//bringFreeList()

	public List<FreeCommenDTO> bringReplyFreeCount() {
		List<FreeCommenDTO> replyCountList = null;
		replyCountList = sqlSession.selectList("bringReplyFreeCount");
		return replyCountList;
	}

	public void freeAdd(FreeDTO dto) {
		sqlSession.insert("freeWrite", dto);
	}

	public void freeAddHits(String bod_num) {
		sqlSession.update("freeAddHits",bod_num);
	}

	public FreeDTO bringFreeDetail(String bod_num) {
		FreeDTO dto = null;
		dto = (FreeDTO)sqlSession.selectOne("bringFreeDetail", bod_num);
		return dto ;
	}

	public List<FreeCommenDTO> bringFreeReply(String bod_num) {
		List<FreeCommenDTO> list = null;
		list = (List<FreeCommenDTO>)sqlSession.selectList("bringFreeReply",bod_num);
		return list;
	}

	public void freeBoardModify(FreeDTO dto) {
		sqlSession.update("freeBoardModify", dto);
	}

	public void deleteFreeComment(String bod_num) {
		sqlSession.delete("deleteFreeComment",bod_num);
	}

	public void deleteFree(String bod_num) {
		sqlSession.delete("deleteFree",bod_num);
	}//deleteFree()

	public void freeAddReply(FreeCommenDTO dto) {
		sqlSession.insert("freeAddReply",dto);
	}//freeAddReply()

	public void freeDeleteReply(String cf_num) {
		sqlSession.delete("freeDeleteReply", cf_num);
	}//freeDeleteReply()

	public void freeModifyReply(FreeCommenDTO dto) {
		sqlSession.update("freeModifyReply", dto);
	}

	public List<FreeDTO> searchFree_subject(SearchFreeDTO dto) {
		List<FreeDTO> list = null;
		list = sqlSession.selectList("searchFree_subject", dto);
		return list;
	}

	public int searchFree_subjectTotalCount(SearchFreeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFree_subject_totalCount", dto);
		return totalCount;
	}

	public List<FreeDTO> searchFree_content(SearchFreeDTO dto) {
		List<FreeDTO> list = null;
		list = sqlSession.selectList("searchFree_content", dto);
		return list;
	}

	public int searchFree_contentTotalCount(SearchFreeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFree_content_totalCount", dto);
		return totalCount;
	}

	public List<FreeDTO> searchFree_sub_cont(SearchFreeDTO dto) {
		List<FreeDTO> list = null;
		list = sqlSession.selectList("searchFree_sub_cont", dto);
		return list;
	}

	public int searchFree_sub_cont_TotalCount(SearchFreeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFree_sub_cont_totalCount", dto);
		return totalCount;
	}

	public List<FreeDTO> searchFree_id(SearchFreeDTO dto) {
		List<FreeDTO> list = null;
		list = sqlSession.selectList("searchFree_id", dto);
		return list;
	}

	public int searchFree_id_TotalCount(SearchFreeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFree_id_totalCount", dto);
		return totalCount;
	}
	
	
}
