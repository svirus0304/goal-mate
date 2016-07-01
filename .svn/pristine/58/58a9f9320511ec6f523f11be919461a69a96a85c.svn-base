package com.GoalMate.www;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.Notice.NoticeDAOImp;
import com.GoalMate.www.DTO.NoCommenDTO;
import com.GoalMate.www.DTO.NoticeDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.PhotoDTO;
import com.GoalMate.www.DTO.SearchNoticeDTO;

@Controller
public class Notice {

	private static final Logger logger = LoggerFactory.getLogger(Notice.class);
	
	@Resource(name="noticeDao")
	private NoticeDAOImp noticeDAOImp;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeListT", method = RequestMethod.GET)
	public String noticeListT(Model model) {
		model.addAttribute("page", "/noticeList");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model,PagingDTO pagingDTO,@RequestParam(value = "pageNo", required = false) String pageNo,HttpSession session) {//공지사항 목록 불러오기
		List<NoticeDTO> list = null; //값 초기화
		pagingDTO.setTotalCount(0);//값 초기화
		
		pagingDTO.setPageSize(15); // 한 페이지에 보일 게시글 수
		pagingDTO.setPageNo(1); // 현재 페이지 번호
		if(pageNo!=null){
			pagingDTO.setPageNo(Integer.parseInt(pageNo));
		}//if
		pagingDTO.setBlockSize(4); //한번에 페이지 넘버가 몇까지 보이게 할거냐 5페이지까지있는데 4페이지까지만 보이게 하고 다음으로 넘기면 5페이지가 나오는것
		pagingDTO.setTotalCount(noticeDAOImp.bringNoticeTotalCount()); // 게시물 총 개수
		list = noticeDAOImp.bringNoticeList(pagingDTO);
		List<NoCommenDTO> replyCountList = noticeDAOImp.bringReplyCount();//각 글들의 댓글수 가져오기
		String type = (String)session.getAttribute("type");
		
		if (session.getAttribute("searchList")!=null) {
			list = (List<NoticeDTO>)session.getAttribute("searchList");
			pagingDTO.setTotalCount((Integer)session.getAttribute("searchListTotalCount")); // 게시물 총 개수
			session.setAttribute("searchList", null);
			session.setAttribute("searchListTotalCount", null);
		}//if
		
		for (int i = 0; i < replyCountList.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (list.get(j).getBad_num()==replyCountList.get(i).getBad_num()) {
					list.get(j).setBad_rcount(replyCountList.get(i).getBad_rcount());
				}//if
			}//inner for
		}//for
		
		model.addAttribute("type", type);
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("noticeList", list);
		model.addAttribute("replyCountList", replyCountList);
		return "community/notice/noticeList";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeWriteFormT", method = RequestMethod.GET)
	public String noticeWriteFormT(Model model) {
		model.addAttribute("page", "/noticeWriteForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeWriteForm", method = RequestMethod.GET)
	public String noticeWriteForm(Model model) {
		return "community/notice/noticeWriteForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticePhotoUpload", method = RequestMethod.POST)
	public String noticePhotoUpload(HttpServletRequest request,PhotoDTO vo) {
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "resources" + File.separator +"img"+ File.separator+ "noticeBoard" + File.separator;              
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=http://localhost/www/resources/img/noticeBoard/"+realname;
	            NoticeDTO dto = new NoticeDTO();
	            dto.setBad_path(realname);
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeMultiplePhotoUpload", method = RequestMethod.POST)
	public void noticeMultiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "img" + File.separator+ "noticeBoard" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"http://localhost/www/resources/img/noticeBoard/"+realFileNm;
	         NoticeDTO dto = new NoticeDTO();
	         dto.setBad_path(realFileNm);
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public ModelAndView noticeWrite(Model model,NoticeDTO dto) {
		noticeDAOImp.noticeAdd(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/noticeList");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/noticeDetailT", method = RequestMethod.GET)
		public String noticeDetailT(Model model,String bad_num) {//공지사항 상세 가기전 템플레이트에 집어넣기
			model.addAttribute("bad_num", bad_num);
			model.addAttribute("page", "/noticeDetail");
			return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Model model,String bad_num,HttpSession session) {//공지사항 상세
		int old_ca_num=0;
		String type="";
		String modifyFocusAble="";
		if (session.getAttribute("type")==null) {
			type = "guest";
		}else {
			type = (String)session.getAttribute("type");
		}
		
		if (session.getAttribute("modifyFocusAble")!=null) {
				if (session.getAttribute("old_ca_num")!=null) {
					old_ca_num = (Integer)session.getAttribute("old_ca_num");
				}
				modifyFocusAble = (String)session.getAttribute("modifyFocusAble");
				session.setAttribute("modifyFocusAble", "false");
		}
		String id = "";
		if (type.equals("admin")) {
			id="admin";
			model.addAttribute("id",id);
		}else if (type.equals("club")) {
			id=(String)session.getAttribute("club_id");
			model.addAttribute("id",id);
		}else {
			id=(String)session.getAttribute("mem_id");
			model.addAttribute("id",id);
		}//else
		noticeDAOImp.noticeAddHits(bad_num); // 조회수 올리기
		NoticeDTO dto = noticeDAOImp.bringNoticeDetail(bad_num);
		List<NoCommenDTO> list = noticeDAOImp.bringNoticeReply(bad_num);
		model.addAttribute("type", type);
		model.addAttribute("noticeReplyList", list);
		model.addAttribute("bad_num", bad_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("old_ca_num", old_ca_num);
		model.addAttribute("modifyFocusAble", modifyFocusAble);
		return "community/notice/noticeDetail";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModifyFormT", method = RequestMethod.GET)
	public String noticeModifyFormT(Model model,String bad_num) {//공지사항 수정폼
		model.addAttribute("bad_num", bad_num);
		model.addAttribute("page","/noticeModifyForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModifyForm", method = RequestMethod.GET)
	public String noticeModifyForm(Model model,String bad_num) {//공지사항 수정폼
		NoticeDTO dto = noticeDAOImp.bringNoticeDetail(bad_num);
		model.addAttribute("dto", dto);
		return "community/notice/noticeModifyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModify", method = RequestMethod.POST)
	public ModelAndView noticeModify(Model model,NoticeDTO dto) {//공지사항 수정
		noticeDAOImp.noticeBoardModify(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/noticeList");
		return mav;
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
	public ModelAndView noticeDelete(Model model,String bad_num) {//공지사항 삭제
		noticeDAOImp.deleteNoticeComment(bad_num);
		noticeDAOImp.deleteNotice(bad_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/noticeList");
		return mav;
	}//noticeDelete()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeReply", method = RequestMethod.POST)
	public ModelAndView noticeReply(Model model,NoCommenDTO dto,HttpSession session){
		dto.setCa_type((String)session.getAttribute("type"));
		noticeDAOImp.noticeAddReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bad_num", dto.getBad_num());
		mav.setViewName("redirect:/noticeDetailT");
		return mav;
	}//noticeReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/deleteNoticeReply", method = RequestMethod.GET)
	public ModelAndView deleteNoticeReply(Model model,String ca_num,String bad_num){
		noticeDAOImp.noticeDeleteReply(ca_num);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bad_num", bad_num);
		mav.setViewName("redirect:/noticeDetailT");
		return mav;
	}//deleteNoticeReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/go_modifyPage", method = RequestMethod.POST)
	public ModelAndView go_modifyPage(Model model,NoCommenDTO dto,HttpSession session){
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bad_num",  dto.getBad_num());
		model.addAttribute("ca_num", dto.getCa_num());
		mav.setViewName("redirect:/noticeModifyReplyFormT");
		return mav;
	}//go_modifyPage()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModifyReplyFormT", method = RequestMethod.GET)
	public String noticeModifyReplyFormT(Model model,String bad_num,String ca_num) {//공지사항 댓글 수정 가기전 템플레이트에 집어넣기
		model.addAttribute("ca_num", ca_num);
		model.addAttribute("bad_num", bad_num);
		model.addAttribute("page", "/noticeModifyReplyForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModifyReplyForm", method = RequestMethod.GET)
	public String noticeModifyReplyForm(Model model,String bad_num,String ca_num,HttpSession session) {//공지사항 댓글 수정 폼
		String ca_nums=ca_num;
		if (session.getAttribute("type")==null) {//댓글수정 시 그 주소창을 가지고 비로그인상태로 들어오려고 할때 튕겨내기
			return "member/mem/memPleaseLogin";
		}//if
		String type = (String)session.getAttribute("type");
		String id = "";
		if (type.equals("admin")) {
			id="admin";
			model.addAttribute("id",id);
		}else if (type.equals("club")) {
			id=(String)session.getAttribute("club_id");
			model.addAttribute("id",id);
		}else if (type.equals("user")){
			id=(String)session.getAttribute("mem_id");
			model.addAttribute("id",id);
		}
		NoticeDTO dto = noticeDAOImp.bringNoticeDetail(bad_num);
		List<NoCommenDTO> list = noticeDAOImp.bringNoticeReply(bad_num);
		model.addAttribute("type", type);
		model.addAttribute("noticeReplyList", list);
		model.addAttribute("bad_num", bad_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("ca_nums", ca_nums);
		return "community/notice/noticeModifyReplyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeModifyReply", method = RequestMethod.POST)
	public ModelAndView noticeModifyReply(Model model,NoCommenDTO dto,HttpSession session){ //댓글 수정
		session.setAttribute("modifyFocusAble","true");
		session.setAttribute("old_ca_num",dto.getCa_num());
		noticeDAOImp.noticeModifyReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bad_num", dto.getBad_num());
		mav.setViewName("redirect:/noticeDetailT");
		return mav;
	}//noticeModifyReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/search_Notice", method = RequestMethod.POST)
	public ModelAndView search_Notice(Model model,SearchNoticeDTO dto,HttpSession session){ //댓글 수정
		int totalCount=0;
		if (dto.getSearch_type().equals("제목")) {
			List<NoticeDTO> searchList = noticeDAOImp.searchNotice_subject(dto);
			session.setAttribute("searchList",searchList);
			totalCount=noticeDAOImp.searchNotice_subjectTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("내용")) {
			List<NoticeDTO> searchList = noticeDAOImp.searchNotice_content(dto);
			session.setAttribute("searchList",searchList);
			totalCount=noticeDAOImp.searchNotice_contentTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("제목+내용")) {
			List<NoticeDTO> searchList = noticeDAOImp.searchNotice_sub_cont(dto);
			session.setAttribute("searchList",searchList);
			totalCount=noticeDAOImp.searchNotice_sub_cont_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
		}//else if
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/noticeListT");
		return mav;
	}//search_Notice()
	


}//Notice Controller
