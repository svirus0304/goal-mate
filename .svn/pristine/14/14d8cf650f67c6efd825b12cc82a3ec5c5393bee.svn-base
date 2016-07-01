package com.GoalMate.www.DAO.Notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GoalMate.www.DTO.NoCommenDTO;
import com.GoalMate.www.DTO.NoticeDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.SearchNoticeDTO;

public class NoticeDAOImp implements NoticeDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setSqlSession()

	public int bringNoticeTotalCount() {// 총 게시물 수 가져오기
		int totalCount=0;
		totalCount = (Integer)sqlSession.selectOne("bringNoticeTotalCount");
		return totalCount;
	}//bringNoticeTotalCount()
	
	public List<NoticeDTO> bringNoticeList(PagingDTO pagingDTO) {//공지사항 목록 불러오기
		List<NoticeDTO> list = null;
		list = (List<NoticeDTO>)sqlSession.selectList("bringNoticeList",pagingDTO);
		return list;
	}//bringNoticeList()
	
	public List<NoCommenDTO> bringReplyCount() {
		List<NoCommenDTO> replyCountList = null;
		replyCountList = sqlSession.selectList("bringReplyCount");
		return replyCountList;
	}	

	public void noticeAdd(NoticeDTO dto) {
		sqlSession.insert("noticeWrite", dto);
	}
	
	public void noticeAddHits(String bad_num) {
		sqlSession.update("noticeAddHits",bad_num);
	}
	
	public NoticeDTO bringNoticeDetail(String bad_num) {
		NoticeDTO dto = null;
		dto = (NoticeDTO)sqlSession.selectOne("bringNoticeDetail", bad_num);
		return dto ;
	}

	public List<NoCommenDTO> bringNoticeReply(String bad_num) {
		List<NoCommenDTO> list = null;
		list = (List<NoCommenDTO>)sqlSession.selectList("bringNoticeReply",bad_num);
		return list;
	}
	
	public void noticeBoardModify(NoticeDTO dto) {
		sqlSession.update("noticeBoardModify", dto);
	}

	public void deleteNoticeComment(String bad_num) {
		sqlSession.delete("deleteNoticeComment",bad_num);
	}	
	
	public void deleteNotice(String bad_num) {
		sqlSession.delete("deleteNotice",bad_num);
	}//deleteNotice()

	public void noticeAddReply(NoCommenDTO dto) {
		sqlSession.insert("noticeAddReply",dto);
	}//noticeAddReply()

	public void noticeDeleteReply(String ca_num) {
		sqlSession.delete("noticeDeleteReply", ca_num);
	}//noticeDeleteReply()

	public void noticeModifyReply(NoCommenDTO dto) {
		sqlSession.update("noticeModifyReply", dto);
	}

	public List<NoticeDTO> searchNotice_subject(SearchNoticeDTO dto) {
		List<NoticeDTO> list = null;
		list = sqlSession.selectList("searchNotice_subject", dto);
		return list;
	}

	public int searchNotice_subjectTotalCount(SearchNoticeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchNotice_subject_totalCount", dto);
		return totalCount;
	}
	
	public List<NoticeDTO> searchNotice_content(SearchNoticeDTO dto) {
		List<NoticeDTO> list = null;
		list = sqlSession.selectList("searchNotice_content", dto);
		return list;
	}

	public int searchNotice_contentTotalCount(SearchNoticeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchNotice_content_totalCount", dto);
		return totalCount;
	}

	public List<NoticeDTO> searchNotice_sub_cont(SearchNoticeDTO dto) {
		List<NoticeDTO> list = null;
		list = sqlSession.selectList("searchNotice_sub_cont", dto);
		return list;
	}

	public int searchNotice_sub_cont_TotalCount(SearchNoticeDTO dto) {
		int totalCount=0;
		totalCount=(Integer)sqlSession.selectOne("searchNotice_sub_cont_totalCount", dto);
		return totalCount;
	}






	
	
}//noticeDAOImp
