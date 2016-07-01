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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.FindClub.FindClubDAOImp;
import com.GoalMate.www.DTO.ClubCommenDTO;
import com.GoalMate.www.DTO.FindClubDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.PhotoDTO;
import com.GoalMate.www.DTO.SearchFindClubDTO;

@Controller
public class FindClub {

	private static final Logger logger = LoggerFactory.getLogger(FindClub.class);
	
	@Resource(name="findClubDao")
	private FindClubDAOImp findClubDAOImp;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubListT", method = RequestMethod.GET)
	public String findClubListT(Model model) {
		model.addAttribute("page", "/findClubList");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubList", method = RequestMethod.GET)
	public String findClubList(Model model,PagingDTO pagingDTO,@RequestParam(value = "pageNo", required = false) String pageNo,HttpSession session) {//공지사항 목록 불러오기
		List<FindClubDTO> list = null; //값 초기화
		pagingDTO.setTotalCount(0);//값 초기화
		
		pagingDTO.setPageSize(15); // 한 페이지에 보일 게시글 수
		pagingDTO.setPageNo(1); // 현재 페이지 번호
		if(pageNo!=null){
			pagingDTO.setPageNo(Integer.parseInt(pageNo));
		}//if
		pagingDTO.setBlockSize(4); //한번에 페이지 넘버가 몇까지 보이게 할거냐 5페이지까지있는데 4페이지까지만 보이게 하고 다음으로 넘기면 5페이지가 나오는것
		pagingDTO.setTotalCount(findClubDAOImp.bringFindClubTotalCount()); // 게시물 총 개수
		list = findClubDAOImp.bringFindClubList(pagingDTO);
		List<ClubCommenDTO> replyCountList = findClubDAOImp.bringReplyFindClubCount();//각 글들의 댓글수 가져오기
		String type = (String)session.getAttribute("type");
		
		if (session.getAttribute("searchList")!=null) {
			list = (List<FindClubDTO>)session.getAttribute("searchList");
			pagingDTO.setTotalCount((Integer)session.getAttribute("searchListTotalCount")); // 게시물 총 개수
			session.setAttribute("searchList", null);
			session.setAttribute("searchListTotalCount", null);
		}//if
		
		for (int i = 0; i < replyCountList.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (list.get(j).getBcl_num()==replyCountList.get(i).getBcl_num()) {
					list.get(j).setBcl_rcount(replyCountList.get(i).getBcl_rcount());
				}//if
			}//inner for
		}//for
		
		model.addAttribute("type", type);
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("findClubList", list);
		model.addAttribute("replyCountList", replyCountList);
		return "community/club/findClubList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubWriteFormT", method = RequestMethod.GET)
	public String findClubWriteFormT(Model model) {
		model.addAttribute("page", "/findClubWriteForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubWriteForm", method = RequestMethod.GET)
	public String findClubBoard(Model model,HttpSession session) {
		if (!(session.getAttribute("type").equals("user")||session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("club"))) {
			return "member/mem/memPleaseLogin";
		}//if
		return "community/club/findClubWriteForm";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubPhotoUpload", method = RequestMethod.POST)
	public String findClubPhotoUpload(HttpServletRequest request,PhotoDTO vo) {
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
	            String path = defaultPath + "resources" + File.separator +"img"+ File.separator+ "findClub" + File.separator;              
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=http://localhost/www/resources/img/findClub/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubMultiplePhotoUpload", method = RequestMethod.POST)
	public void findClubMultiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
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
	         String filePath = dftFilePath + "resources" + File.separator + "img" + File.separator+ "findClub" + File.separator;
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
	         sFileInfo += "&sFileURL="+"http://localhost/www/resources/img/findClub/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubWrite", method = RequestMethod.POST)
	public ModelAndView findClubWrite(Model model,FindClubDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("user")) {
			dto.setBcl_id((String)session.getAttribute("mem_id"));
		}else if (session.getAttribute("type").equals("club")) {
			dto.setBcl_id((String)session.getAttribute("club_id"));
		}else if (session.getAttribute("type")==null) {
			mav.setViewName("redirect:/template?page=/memPleaseLogin");
			return mav;
		}
		dto.setBcl_type((String)session.getAttribute("type"));
		int resultVal = findClubDAOImp.findClubAdd(dto);
		mav.setViewName("redirect:/template?page=/findClubList");
		return mav;

	}
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubDetailT", method = RequestMethod.GET)
	public String findClubDetailT(Model model,String bcl_num) {//공지사항 상세 가기전 템플레이트에 집어넣기
		model.addAttribute("bcl_num", bcl_num);
		model.addAttribute("page", "/findClubDetail");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubDetail", method = RequestMethod.GET)
	public String findClubDetail(Model model,String bcl_num,HttpSession session) {//공지사항 상세
		int old_cc_num=0;
		String type="";
		String modifyFocusAble="";
		if (session.getAttribute("type")==null) {
			type = "guest";
		}else {
			type = (String)session.getAttribute("type");
		}
		
		if (session.getAttribute("modifyFocusAble")!=null) {
				if (session.getAttribute("old_cc_num")!=null) {
					old_cc_num = (Integer)session.getAttribute("old_cc_num");
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
		findClubDAOImp.findClubAddHits(bcl_num); // 조회수 올리기
		FindClubDTO dto = findClubDAOImp.bringFindClubDetail(bcl_num);
		List<ClubCommenDTO> list = findClubDAOImp.bringFindClubReply(bcl_num);
		model.addAttribute("type", type);
		model.addAttribute("findClubReplyList", list);
		model.addAttribute("bcl_num", bcl_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("old_cc_num", old_cc_num);
		model.addAttribute("modifyFocusAble", modifyFocusAble);
		return "community/club/findClubDetail";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModifyFormT", method = RequestMethod.GET)
	public String findClubModifyFormT(Model model,String bcl_num) {//공지사항 수정폼
		model.addAttribute("bcl_num", bcl_num);
		model.addAttribute("page","/findClubModifyForm");
		return "template";
	}	

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModifyForm", method = RequestMethod.GET)
	public String findClubModifyForm(Model model,String bcl_num) {//공지사항 수정폼
		FindClubDTO dto = findClubDAOImp.bringFindClubDetail(bcl_num);
		model.addAttribute("dto", dto);
		return "community/club/findClubModifyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModify", method = RequestMethod.POST)
	public ModelAndView findClubModify(Model model,FindClubDTO dto) {//공지사항 수정
		findClubDAOImp.findClubModify(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/findClubList");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubDelete", method = RequestMethod.GET)
	public ModelAndView findClubDelete(Model model,String bcl_num) {//공지사항 삭제
		findClubDAOImp.deleteFindClubComment(bcl_num);
		findClubDAOImp.deleteFindClub(bcl_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/findClubList");
		return mav;
	}//freeDelete()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubReply", method = RequestMethod.POST)
	public ModelAndView findClubReply(Model model,ClubCommenDTO dto,HttpSession session){
		dto.setCc_type((String)session.getAttribute("type"));
		findClubDAOImp.findClubAddReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bcl_num", dto.getBcl_num());
		mav.setViewName("redirect:/findClubDetailT");
		return mav;
	}//freeReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/deleteFindClubReply", method = RequestMethod.GET)
	public ModelAndView deleteFindClubReply(Model model,String cc_num,String bcl_num){
		findClubDAOImp.findClubDeleteReply(cc_num);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bcl_num", bcl_num);
		mav.setViewName("redirect:/findClubDetailT");
		return mav;
	}//deleteFreeReply()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/go_modifyPageFindClub", method = RequestMethod.POST)
	public ModelAndView go_modifyPageFindClub(Model model,ClubCommenDTO dto,HttpSession session){
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bcl_num",  dto.getBcl_num());
		model.addAttribute("cc_num", dto.getCc_num());
		mav.setViewName("redirect:/findClubModifyReplyFormT");
		return mav;
	}//go_modifyPageFree()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModifyReplyFormT", method = RequestMethod.GET)
	public String findClubModifyReplyFormT(Model model,String bcl_num,String cc_num) {//공지사항 댓글 수정 가기전 템플레이트에 집어넣기
		model.addAttribute("cc_num", cc_num);
		model.addAttribute("bcl_num", bcl_num);
		model.addAttribute("page", "/findClubModifyReplyForm");
		return "template";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModifyReplyForm", method = RequestMethod.GET)
	public String findClubModifyReplyForm(Model model,String bcl_num,String cc_num,HttpSession session) {//공지사항 댓글 수정 폼
		String cc_nums=cc_num;
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
		FindClubDTO dto = findClubDAOImp.bringFindClubDetail(bcl_num);
		List<ClubCommenDTO> list = findClubDAOImp.bringFindClubReply(bcl_num);
		model.addAttribute("type", type);
		model.addAttribute("findClubReplyList", list);
		model.addAttribute("bcl_num", bcl_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("cc_nums", cc_nums);
		return "community/club/findClubModifyReplyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findClubModifyReply", method = RequestMethod.POST)
	public ModelAndView findClubModifyReply(Model model,ClubCommenDTO dto,HttpSession session){ //댓글 수정
		session.setAttribute("modifyFocusAble","true");
		session.setAttribute("old_cc_num",dto.getCc_num());
		findClubDAOImp.findClubModifyReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bcl_num", dto.getBcl_num());
		mav.setViewName("redirect:/findClubDetailT");
		return mav;
	}//freeModifyReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/search_FindClub", method = RequestMethod.POST)
	public ModelAndView search_FindClub(Model model,SearchFindClubDTO dto,HttpSession session){ //댓글 수정
		int totalCount=0;
		if (dto.getSearch_type().equals("제목")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_subject(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_subjectTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("내용")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_content(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_contentTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("제목+내용")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_sub_cont(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_sub_cont_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("지역")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_area(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_area_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("나이")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_age(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_age_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("작성자")) {
			List<FindClubDTO> searchList = findClubDAOImp.searchFindClub_id(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findClubDAOImp.searchFindClub_id_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/findClubListT");
		return mav;
	}//search_Free()	

}//HomeController
