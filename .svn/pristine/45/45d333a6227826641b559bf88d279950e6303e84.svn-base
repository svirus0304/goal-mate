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

import com.GoalMate.www.DAO.Free.FreeDAOImp;
import com.GoalMate.www.DTO.FreeCommenDTO;
import com.GoalMate.www.DTO.FreeDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.PhotoDTO;
import com.GoalMate.www.DTO.SearchFreeDTO;

@Controller
public class FreeBoard {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoard.class);

	@Resource(name="freeDao")
	private FreeDAOImp freeDAOImp;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeBoardListT", method = RequestMethod.GET)
	public String freeBoardListT(Model model) {
		model.addAttribute("page", "/freeBoardList");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeBoardList", method = RequestMethod.GET)
	public String freeBoardList(Model model,PagingDTO pagingDTO,@RequestParam(value = "pageNo", required = false) String pageNo,HttpSession session) {//공지사항 목록 불러오기
		List<FreeDTO> list = null; //값 초기화
		pagingDTO.setTotalCount(0);//값 초기화
		
		pagingDTO.setPageSize(15); // 한 페이지에 보일 게시글 수
		pagingDTO.setPageNo(1); // 현재 페이지 번호
		if(pageNo!=null){
			pagingDTO.setPageNo(Integer.parseInt(pageNo));
		}//if
		pagingDTO.setBlockSize(4); //한번에 페이지 넘버가 몇까지 보이게 할거냐 5페이지까지있는데 4페이지까지만 보이게 하고 다음으로 넘기면 5페이지가 나오는것
		pagingDTO.setTotalCount(freeDAOImp.bringFreeTotalCount()); // 게시물 총 개수
		list = freeDAOImp.bringFreeList(pagingDTO);
		List<FreeCommenDTO> replyCountList = freeDAOImp.bringReplyFreeCount();//각 글들의 댓글수 가져오기
		String type = (String)session.getAttribute("type");
		
		if (session.getAttribute("searchList")!=null) {
			list = (List<FreeDTO>)session.getAttribute("searchList");
			pagingDTO.setTotalCount((Integer)session.getAttribute("searchListTotalCount")); // 게시물 총 개수
			session.setAttribute("searchList", null);
			session.setAttribute("searchListTotalCount", null);
		}//if
		
		for (int i = 0; i < replyCountList.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (list.get(j).getBod_num()==replyCountList.get(i).getBod_num()) {
					list.get(j).setBod_rcount(replyCountList.get(i).getBod_rcount());
				}//if
			}//inner for
		}//for
		
		model.addAttribute("type", type);
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("freeList", list);
		model.addAttribute("replyCountList", replyCountList);
		return "community/free/freeBoardList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeBoardWriteFormT", method = RequestMethod.GET)
	public String freeBoardWriteFormT(Model model) {
		model.addAttribute("page", "/freeBoardWriteForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeBoardWriteForm", method = RequestMethod.GET)
	public String freeBoard(Model model,HttpSession session) {
		if (!(session.getAttribute("type").equals("user")||session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("club"))) {
			return "member/mem/memPleaseLogin";
		}//if
		
		return "community/free/freeBoardWriteForm";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freePhotoUpload", method = RequestMethod.POST)
	public String freePhotoUpload(HttpServletRequest request,PhotoDTO vo) {
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
	            String path = defaultPath + "resources" + File.separator +"img"+ File.separator+ "freeBoard" + File.separator;              
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=http://localhost/www/resources/img/freeBoard/"+realname;
	            FreeDTO dto = new FreeDTO();
	            dto.setBod_path(realname);
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeMultiplePhotoUpload", method = RequestMethod.POST)
	public void freeMultiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
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
	         String filePath = dftFilePath + "resources" + File.separator + "img" + File.separator+ "freeBoard" + File.separator;
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
	         sFileInfo += "&sFileURL="+"http://localhost/www/resources/img/freeBoard/"+realFileNm;
	         FreeDTO dto = new FreeDTO();
	         dto.setBod_path(realFileNm);
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeWrite", method = RequestMethod.POST)
	public ModelAndView freeWrite(Model model,FreeDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("user")) {
			dto.setBod_id((String)session.getAttribute("mem_id"));
		}else if (session.getAttribute("type").equals("club")) {
			dto.setBod_id((String)session.getAttribute("club_id"));
		}else if (session.getAttribute("type")==null) {
			mav.setViewName("redirect:/template?page=/memPleaseLogin");
			return mav;
		}
		dto.setBod_type((String)session.getAttribute("type"));
		freeDAOImp.freeAdd(dto);
		mav.setViewName("redirect:/template?page=/freeBoardList");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeDetailT", method = RequestMethod.GET)
	public String freeDetailT(Model model,String bod_num) {//공지사항 상세 가기전 템플레이트에 집어넣기
		model.addAttribute("bod_num", bod_num);
		model.addAttribute("page", "/freeDetail");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeDetail", method = RequestMethod.GET)
	public String freeDetail(Model model,String bod_num,HttpSession session) {//공지사항 상세
		int old_cf_num=0;
		String type="";
		String modifyFocusAble="";
		if (session.getAttribute("type")==null) {
			type = "guest";
		}else {
			type = (String)session.getAttribute("type");
		}
		
		if (session.getAttribute("modifyFocusAble")!=null) {
				if (session.getAttribute("old_cf_num")!=null) {
					old_cf_num = (Integer)session.getAttribute("old_cf_num");
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
		freeDAOImp.freeAddHits(bod_num); // 조회수 올리기
		FreeDTO dto = freeDAOImp.bringFreeDetail(bod_num);
		List<FreeCommenDTO> list = freeDAOImp.bringFreeReply(bod_num);
		model.addAttribute("type", type);
		model.addAttribute("freeReplyList", list);
		model.addAttribute("bod_num", bod_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("old_cf_num", old_cf_num);
		model.addAttribute("modifyFocusAble", modifyFocusAble);
		return "community/free/freeBoardDetail";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModifyFormT", method = RequestMethod.GET)
	public String freeModifyFormT(Model model,String bod_num) {//공지사항 수정폼
		model.addAttribute("bod_num", bod_num);
		model.addAttribute("page","/freeModifyForm");
		return "template";
	}	

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModifyForm", method = RequestMethod.GET)
	public String freeModifyForm(Model model,String bod_num) {//공지사항 수정폼
		FreeDTO dto = freeDAOImp.bringFreeDetail(bod_num);
		model.addAttribute("dto", dto);
		return "community/free/freeBoardModifyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModify", method = RequestMethod.POST)
	public ModelAndView freeModify(Model model,FreeDTO dto) {//공지사항 수정
		freeDAOImp.freeBoardModify(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/freeBoardList");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
	public ModelAndView freeDelete(Model model,String bod_num) {//공지사항 삭제
		freeDAOImp.deleteFreeComment(bod_num);
		freeDAOImp.deleteFree(bod_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/freeBoardList");
		return mav;
	}//freeDelete()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeReply", method = RequestMethod.POST)
	public ModelAndView freeReply(Model model,FreeCommenDTO dto,HttpSession session){
		dto.setCf_type((String)session.getAttribute("type"));
		freeDAOImp.freeAddReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bod_num", dto.getBod_num());
		mav.setViewName("redirect:/freeDetailT");
		return mav;
	}//freeReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/deleteFreeReply", method = RequestMethod.GET)
	public ModelAndView deleteFreeReply(Model model,String cf_num,String bod_num){
		freeDAOImp.freeDeleteReply(cf_num);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bod_num", bod_num);
		mav.setViewName("redirect:/freeDetailT");
		return mav;
	}//deleteFreeReply()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/go_modifyPageFree", method = RequestMethod.POST)
	public ModelAndView go_modifyPageFree(Model model,FreeCommenDTO dto,HttpSession session){
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bod_num",  dto.getBod_num());
		model.addAttribute("cf_num", dto.getCf_num());
		mav.setViewName("redirect:/freeModifyReplyFormT");
		return mav;
	}//go_modifyPageFree()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModifyReplyFormT", method = RequestMethod.GET)
	public String freeModifyReplyFormT(Model model,String bod_num,String cf_num) {//공지사항 댓글 수정 가기전 템플레이트에 집어넣기
		model.addAttribute("cf_num", cf_num);
		model.addAttribute("bod_num", bod_num);
		model.addAttribute("page", "/freeModifyReplyForm");
		return "template";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModifyReplyForm", method = RequestMethod.GET)
	public String freeModifyReplyForm(Model model,String bod_num,String cf_num,HttpSession session) {//공지사항 댓글 수정 폼
		String cf_nums=cf_num;
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
		FreeDTO dto = freeDAOImp.bringFreeDetail(bod_num);
		List<FreeCommenDTO> list = freeDAOImp.bringFreeReply(bod_num);
		model.addAttribute("type", type);
		model.addAttribute("freeReplyList", list);
		model.addAttribute("bod_num", bod_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("cf_nums", cf_nums);
		return "community/free/freeBoardModifyReplyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/freeModifyReply", method = RequestMethod.POST)
	public ModelAndView freeModifyReply(Model model,FreeCommenDTO dto,HttpSession session){ //댓글 수정
		session.setAttribute("modifyFocusAble","true");
		session.setAttribute("old_cf_num",dto.getCf_num());
		freeDAOImp.freeModifyReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bod_num", dto.getBod_num());
		mav.setViewName("redirect:/freeDetailT");
		return mav;
	}//freeModifyReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/search_Free", method = RequestMethod.POST)
	public ModelAndView search_Free(Model model,SearchFreeDTO dto,HttpSession session){ //댓글 수정
		int totalCount=0;
		if (dto.getSearch_type().equals("제목")) {
			List<FreeDTO> searchList = freeDAOImp.searchFree_subject(dto);
			session.setAttribute("searchList",searchList);
			totalCount=freeDAOImp.searchFree_subjectTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("내용")) {
			List<FreeDTO> searchList = freeDAOImp.searchFree_content(dto);
			session.setAttribute("searchList",searchList);
			totalCount=freeDAOImp.searchFree_contentTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("제목+내용")) {
			List<FreeDTO> searchList = freeDAOImp.searchFree_sub_cont(dto);
			session.setAttribute("searchList",searchList);
			totalCount=freeDAOImp.searchFree_sub_cont_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
		}else if(dto.getSearch_type().equals("작성자")) {
			List<FreeDTO> searchList = freeDAOImp.searchFree_id(dto);
			session.setAttribute("searchList",searchList);
			totalCount=freeDAOImp.searchFree_id_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/freeBoardListT");
		return mav;
	}//search_Free()	
	
}//FreeBoard Controller
