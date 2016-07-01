package com.GoalMate.www.DAO.FindMercenary;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubCommenDTO;
import com.GoalMate.www.DTO.FindClubDTO;
import com.GoalMate.www.DTO.FindMercenaryDTO;
import com.GoalMate.www.DTO.FreeCommenDTO;
import com.GoalMate.www.DTO.FreeDTO;
import com.GoalMate.www.DTO.MerceCommenDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.SearchFindClubDTO;
import com.GoalMate.www.DTO.SearchFindMercenaryDTO;
import com.GoalMate.www.DTO.SearchFreeDTO;

public class FindMercenaryDAOImp implements FindMercenaryDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int bringFindMercenaryTotalCount() {
		int totalCount=0;
		totalCount = (Integer)sqlSession.selectOne("bringFindMercenaryTotalCount");
		return totalCount;
	}//bringFindMercenaryTotalCount()

	public List<FindMercenaryDTO> bringFindMercenaryList(PagingDTO pagingDTO) {
		List<FindMercenaryDTO> list = null;
		list = (List<FindMercenaryDTO>)sqlSession.selectList("bringFindMercenaryList",pagingDTO);
		return list;
	}//bringFindMercenaryList()

	public List<MerceCommenDTO> bringReplyFindMercenaryCount() {
		List<MerceCommenDTO> replyCountList = null;
		replyCountList = sqlSession.selectList("bringReplyFindMercenaryCount");
		return replyCountList;
	}

	public int findMercenaryAdd(FindMercenaryDTO dto) {
		int resultVal=0;
		resultVal = sqlSession.insert("findMercenaryWrite", dto);
		return resultVal;
	}

	public void findMercenaryAddHits(String bpl_num) {
		sqlSession.update("findMercenaryAddHits",bpl_num);
	}

	public FindMercenaryDTO bringFindMercenaryDetail(String bpl_num) {
		FindMercenaryDTO dto = null;
		dto = (FindMercenaryDTO)sqlSession.selectOne("bringFindMercenaryDetail", bpl_num);
		return dto ;
	}

	public List<MerceCommenDTO> bringFindMercenaryReply(String bpl_num) {
		List<MerceCommenDTO> list = null;
		list = (List<MerceCommenDTO>)sqlSession.selectList("bringFindMercenaryReply",bpl_num);
		return list;
	}

	public void findMercenaryModify(FindMercenaryDTO dto) {
		sqlSession.update("findMercenaryModify", dto);
	}

	public void deleteFindMercenaryComment(String bpl_num) {
		sqlSession.delete("deleteFindMercenaryComment",bpl_num);
	}

	public void deleteFindMercenary(String bpl_num) {
		sqlSession.delete("deleteFindMercenary",bpl_num);
	}//deleteFree()

	public void findMercenaryAddReply(MerceCommenDTO dto) {
		sqlSession.insert("findMercenaryAddReply",dto);
	}//freeAddReply()

	public void findMercenaryDeleteReply(String cp_num) {
		sqlSession.delete("findMercenaryDeleteReply", cp_num);
	}//freeDeleteReply()

	public void findMercenaryModifyReply(MerceCommenDTO dto) {
		sqlSession.update("findMercenaryModifyReply", dto);
	}

	public List<FindMercenaryDTO> searchFindMercenary_subject(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_subject", dto);
		return list;
	}

	public int searchFindMercenary_subjectTotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_subject_totalCount", dto);
		return totalCount;
	}

	public List<FindMercenaryDTO> searchFindMercenary_content(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_content", dto);
		return list;
	}

	public int searchFindMercenary_contentTotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_content_totalCount", dto);
		return totalCount;
	}

	public List<FindMercenaryDTO> searchFindMercenary_sub_cont(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_sub_cont", dto);
		return list;
	}

	public int searchFindMercenary_sub_cont_TotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_sub_cont_totalCount", dto);
		return totalCount;
	}

	public List<FindMercenaryDTO> searchFindMercenary_area(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_area", dto);
		return list;
	}

	public int searchFindMercenary_area_TotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_area_totalCount", dto);
		return totalCount;
	}

	public List<FindMercenaryDTO> searchFindMercenary_age(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_age", dto);
		return list;
	}

	public int searchFindMercenary_age_TotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_age_totalCount", dto);
		return totalCount;
	}

	public List<FindMercenaryDTO> searchFindMercenary_id(SearchFindMercenaryDTO dto) {
		List<FindMercenaryDTO> list = null;
		list = sqlSession.selectList("searchFindMercenary_id", dto);
		return list;
	}

	public int searchFindMercenary_id_TotalCount(SearchFindMercenaryDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindMercenary_id_totalCount", dto);
		return totalCount;
	}
	
}
