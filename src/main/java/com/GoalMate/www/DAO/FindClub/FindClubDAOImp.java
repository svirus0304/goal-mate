package com.GoalMate.www.DAO.FindClub;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.ClubCommenDTO;
import com.GoalMate.www.DTO.FindClubDTO;
import com.GoalMate.www.DTO.FreeCommenDTO;
import com.GoalMate.www.DTO.FreeDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.SearchFindClubDTO;
import com.GoalMate.www.DTO.SearchFreeDTO;

public class FindClubDAOImp implements FindClubDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int bringFindClubTotalCount() {
		int totalCount=0;
		totalCount = (Integer)sqlSession.selectOne("bringFindClubTotalCount");
		return totalCount;
	}//bringFindClubTotalCount()

	public List<FindClubDTO> bringFindClubList(PagingDTO pagingDTO) {
		List<FindClubDTO> list = null;
		list = (List<FindClubDTO>)sqlSession.selectList("bringFindClubList",pagingDTO);
		return list;
	}//bringFindClubList()

	public List<ClubCommenDTO> bringReplyFindClubCount() {
		List<ClubCommenDTO> replyCountList = null;
		replyCountList = sqlSession.selectList("bringReplyFindClubCount");
		return replyCountList;
	}

	public int findClubAdd(FindClubDTO dto) {
		int resultVal=0;
		resultVal = sqlSession.insert("findClubWrite", dto);
		return resultVal;
	}

	public void findClubAddHits(String bcl_num) {
		sqlSession.update("findClubAddHits",bcl_num);
	}

	public FindClubDTO bringFindClubDetail(String bcl_num) {
		FindClubDTO dto = null;
		dto = (FindClubDTO)sqlSession.selectOne("bringFindClubDetail", bcl_num);
		return dto ;
	}

	public List<ClubCommenDTO> bringFindClubReply(String bcl_num) {
		List<ClubCommenDTO> list = null;
		list = (List<ClubCommenDTO>)sqlSession.selectList("bringFindClubReply",bcl_num);
		return list;
	}

	public void findClubModify(FindClubDTO dto) {
		sqlSession.update("findClubModify", dto);
	}

	public void deleteFindClubComment(String bcl_num) {
		sqlSession.delete("deleteFindClubComment",bcl_num);
	}

	public void deleteFindClub(String bcl_num) {
		sqlSession.delete("deleteFindClub",bcl_num);
	}//deleteFree()

	public void findClubAddReply(ClubCommenDTO dto) {
		sqlSession.insert("findClubAddReply",dto);
	}//freeAddReply()

	public void findClubDeleteReply(String cc_num) {
		sqlSession.delete("findClubDeleteReply", cc_num);
	}//freeDeleteReply()

	public void findClubModifyReply(ClubCommenDTO dto) {
		sqlSession.update("findClubModifyReply", dto);
	}

	public List<FindClubDTO> searchFindClub_subject(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_subject", dto);
		return list;
	}

	public int searchFindClub_subjectTotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_subject_totalCount", dto);
		return totalCount;
	}

	public List<FindClubDTO> searchFindClub_content(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_content", dto);
		return list;
	}

	public int searchFindClub_contentTotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_content_totalCount", dto);
		return totalCount;
	}

	public List<FindClubDTO> searchFindClub_sub_cont(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_sub_cont", dto);
		return list;
	}

	public int searchFindClub_sub_cont_TotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_sub_cont_totalCount", dto);
		return totalCount;
	}

	public List<FindClubDTO> searchFindClub_area(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_area", dto);
		return list;
	}

	public int searchFindClub_area_TotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_area_totalCount", dto);
		return totalCount;
	}

	public List<FindClubDTO> searchFindClub_age(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_age", dto);
		return list;
	}

	public int searchFindClub_age_TotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_age_totalCount", dto);
		return totalCount;
	}

	public List<FindClubDTO> searchFindClub_id(SearchFindClubDTO dto) {
		List<FindClubDTO> list = null;
		list = sqlSession.selectList("searchFindClub_id", dto);
		return list;
	}

	public int searchFindClub_id_TotalCount(SearchFindClubDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchFindClub_id_totalCount", dto);
		return totalCount;
	}

	
}
