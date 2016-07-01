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

import com.GoalMate.www.DAO.FindMercenary.FindMercenaryDAOImp;
import com.GoalMate.www.DTO.FindMercenaryDTO;
import com.GoalMate.www.DTO.MerceCommenDTO;
import com.GoalMate.www.DTO.PagingDTO;
import com.GoalMate.www.DTO.PhotoDTO;
import com.GoalMate.www.DTO.SearchFindClubDTO;
import com.GoalMate.www.DTO.SearchFindMercenaryDTO;

@Controller
public class FindMercenary {

	private static final Logger logger = LoggerFactory.getLogger(FindMercenary.class);

	@Resource(name="findMercenaryDao")
	private FindMercenaryDAOImp findMercenaryDAOImp;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryListT", method = RequestMethod.GET)
	public String findMercenaryListT(Model model) {
		model.addAttribute("page", "/findMercenaryList");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryList", method = RequestMethod.GET)
	public String findMercenaryList(Model model,PagingDTO pagingDTO,@RequestParam(value = "pageNo", required = false) String pageNo,HttpSession session) {//공지사항 목록 불러오기
		List<FindMercenaryDTO> list = null; //값 초기화
		pagingDTO.setTotalCount(0);//값 초기화
		
		pagingDTO.setPageSize(15); // 한 페이지에 보일 게시글 수
		pagingDTO.setPageNo(1); // 현재 페이지 번호
		if(pageNo!=null){
			pagingDTO.setPageNo(Integer.parseInt(pageNo));
		}//if
		pagingDTO.setBlockSize(4); //한번에 페이지 넘버가 몇까지 보이게 할거냐 5페이지까지있는데 4페이지까지만 보이게 하고 다음으로 넘기면 5페이지가 나오는것
		pagingDTO.setTotalCount(findMercenaryDAOImp.bringFindMercenaryTotalCount()); // 게시물 총 개수
		list = findMercenaryDAOImp.bringFindMercenaryList(pagingDTO);
		List<MerceCommenDTO> replyCountList = findMercenaryDAOImp.bringReplyFindMercenaryCount();//각 글들의 댓글수 가져오기
		String type = (String)session.getAttribute("type");
		
		if (session.getAttribute("searchList")!=null) {
			list = (List<FindMercenaryDTO>)session.getAttribute("searchList");
			pagingDTO.setTotalCount((Integer)session.getAttribute("searchListTotalCount")); // 게시물 총 개수
			session.setAttribute("searchList", null);
			session.setAttribute("searchListTotalCount", null);
		}//if
		
		for (int i = 0; i < replyCountList.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (list.get(j).getBpl_num()==replyCountList.get(i).getBpl_num()) {
					list.get(j).setBpl_rcount(replyCountList.get(i).getBpl_rcount());
				}//if
			}//inner for
		}//for
		
		model.addAttribute("type", type);
		model.addAttribute("paging", pagingDTO);
		model.addAttribute("findMercenaryList", list);
		model.addAttribute("replyCountList", replyCountList);
		return "community/merce/findMercenaryList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryWriteFormT", method = RequestMethod.GET)
	public String findMercenaryWriteFormT(Model model) {
		model.addAttribute("page", "/findMercenaryWriteForm");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryWriteForm", method = RequestMethod.GET)
	public String findMercenaryBoard(Model model,HttpSession session) {
		if (!(session.getAttribute("type").equals("user")||session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("club"))) {
			return "member/mem/memPleaseLogin";
		}//if
		return "community/merce/findMercenaryWriteForm";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryPhotoUpload", method = RequestMethod.POST)
	public String findMercenaryPhotoUpload(HttpServletRequest request,PhotoDTO vo) {
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
	            String path = defaultPath + "resources" + File.separator +"img"+ File.separator+ "findMercenary" + File.separator;              
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=http://localhost/www/resources/img/findMercenary/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryMultiplePhotoUpload", method = RequestMethod.POST)
	public void findMercenaryMultiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
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
	         String filePath = dftFilePath + "resources" + File.separator + "img" + File.separator+ "findMercenary" + File.separator;
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
	         sFileInfo += "&sFileURL="+"http://localhost/www/resources/img/findMercenary/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryWrite", method = RequestMethod.POST)
	public ModelAndView findMercenaryWrite(Model model,FindMercenaryDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("user")) {
			dto.setBpl_id((String)session.getAttribute("mem_id"));
		}else if (session.getAttribute("type").equals("club")) {
			dto.setBpl_id((String)session.getAttribute("club_id"));
		}else if (session.getAttribute("type")==null) {
			mav.setViewName("redirect:/template?page=/memPleaseLogin");
			return mav;
		}
		dto.setBpl_type((String)session.getAttribute("type"));
		int resultVal = findMercenaryDAOImp.findMercenaryAdd(dto);
		mav.setViewName("redirect:/template?page=/findMercenaryList");
		return mav;

	}
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryDetailT", method = RequestMethod.GET)
	public String findMercenaryDetailT(Model model,String bpl_num) {//공지사항 상세 가기전 템플레이트에 집어넣기
		model.addAttribute("bpl_num", bpl_num);
		model.addAttribute("page", "/findMercenaryDetail");
		return "template";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryDetail", method = RequestMethod.GET)
	public String findMercenaryDetail(Model model,String bpl_num,HttpSession session) {//공지사항 상세
		int old_cp_num=0;
		String type="";
		String modifyFocusAble="";
		if (session.getAttribute("type")==null) {
			type = "guest";
		}else {
			type = (String)session.getAttribute("type");
		}
		
		if (session.getAttribute("modifyFocusAble")!=null) {
				if (session.getAttribute("old_cp_num")!=null) {
					old_cp_num = (Integer)session.getAttribute("old_cp_num");
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
		findMercenaryDAOImp.findMercenaryAddHits(bpl_num); // 조회수 올리기
		FindMercenaryDTO dto = findMercenaryDAOImp.bringFindMercenaryDetail(bpl_num);
		List<MerceCommenDTO> list = findMercenaryDAOImp.bringFindMercenaryReply(bpl_num);
		model.addAttribute("type", type);
		model.addAttribute("findMercenaryReplyList", list);
		model.addAttribute("bpl_num", bpl_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("old_cp_num", old_cp_num);
		model.addAttribute("modifyFocusAble", modifyFocusAble);
		return "community/merce/findMercenaryDetail";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModifyFormT", method = RequestMethod.GET)
	public String findMercenaryModifyFormT(Model model,String bpl_num) {//공지사항 수정폼
		model.addAttribute("bpl_num", bpl_num);
		model.addAttribute("page","/findMercenaryModifyForm");
		return "template";
	}	

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModifyForm", method = RequestMethod.GET)
	public String findMercenaryModifyForm(Model model,String bpl_num) {//공지사항 수정폼
		FindMercenaryDTO dto = findMercenaryDAOImp.bringFindMercenaryDetail(bpl_num);
		model.addAttribute("dto", dto);
		return "community/merce/findMercenaryModifyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModify", method = RequestMethod.POST)
	public ModelAndView findMercenaryModify(Model model,FindMercenaryDTO dto) {//공지사항 수정
		findMercenaryDAOImp.findMercenaryModify(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/findMercenaryList");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryDelete", method = RequestMethod.GET)
	public ModelAndView findMercenaryDelete(Model model,String bpl_num) {//공지사항 삭제
		findMercenaryDAOImp.deleteFindMercenaryComment(bpl_num);
		findMercenaryDAOImp.deleteFindMercenary(bpl_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/findMercenaryList");
		return mav;
	}//freeDelete()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryReply", method = RequestMethod.POST)
	public ModelAndView findMercenaryReply(Model model,MerceCommenDTO dto,HttpSession session){
		dto.setCp_type((String)session.getAttribute("type"));
		findMercenaryDAOImp.findMercenaryAddReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bpl_num", dto.getBpl_num());
		mav.setViewName("redirect:/findMercenaryDetailT");
		return mav;
	}//freeReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/deleteFindMercenaryReply", method = RequestMethod.GET)
	public ModelAndView deletefindMercenaryReply(Model model,String cp_num,String bpl_num){
		findMercenaryDAOImp.findMercenaryDeleteReply(cp_num);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bpl_num", bpl_num);
		mav.setViewName("redirect:/findMercenaryDetailT");
		return mav;
	}//deleteFreeReply()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/go_modifyPageFindMercenary", method = RequestMethod.POST)
	public ModelAndView go_modifyPagefindMercenary(Model model,MerceCommenDTO dto,HttpSession session){
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bpl_num",  dto.getBpl_num());
		model.addAttribute("cp_num", dto.getCp_num());
		mav.setViewName("redirect:/findMercenaryModifyReplyFormT");
		return mav;
	}//go_modifyPageFree()

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModifyReplyFormT", method = RequestMethod.GET)
	public String findMercenaryModifyReplyFormT(Model model,String bpl_num,String cp_num) {//공지사항 댓글 수정 가기전 템플레이트에 집어넣기
		model.addAttribute("cp_num", cp_num);
		model.addAttribute("bpl_num", bpl_num);
		model.addAttribute("page", "/findMercenaryModifyReplyForm");
		return "template";
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModifyReplyForm", method = RequestMethod.GET)
	public String findMercenaryModifyReplyForm(Model model,String bpl_num,String cp_num,HttpSession session) {//공지사항 댓글 수정 폼
		String cp_nums=cp_num;
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
		FindMercenaryDTO dto = findMercenaryDAOImp.bringFindMercenaryDetail(bpl_num);
		List<MerceCommenDTO> list = findMercenaryDAOImp.bringFindMercenaryReply(bpl_num);
		model.addAttribute("type", type);
		model.addAttribute("findMercenaryReplyList", list);
		model.addAttribute("bpl_num", bpl_num);
		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		model.addAttribute("cp_nums", cp_nums);
		return "community/merce/findMercenaryModifyReplyForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/findMercenaryModifyReply", method = RequestMethod.POST)
	public ModelAndView findMercenaryModifyReply(Model model,MerceCommenDTO dto,HttpSession session){ //댓글 수정
		session.setAttribute("modifyFocusAble","true");
		session.setAttribute("old_cp_num",dto.getCp_num());
		findMercenaryDAOImp.findMercenaryModifyReply(dto);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("bpl_num", dto.getBpl_num());
		mav.setViewName("redirect:/findMercenaryDetailT");
		return mav;
	}//freeModifyReply()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/search_findMercenary", method = RequestMethod.POST)
	public ModelAndView search_findMercenary(Model model,SearchFindMercenaryDTO dto,HttpSession session){ //댓글 수정
		int totalCount=0;
		if (dto.getSearch_type().equals("제목")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_subject(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_subjectTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("내용")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_content(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_contentTotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("제목+내용")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_sub_cont(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_sub_cont_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("지역")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_area(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_area_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("나이")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_age(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_age_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
			
		}else if (dto.getSearch_type().equals("작성자")) {
			List<FindMercenaryDTO> searchList = findMercenaryDAOImp.searchFindMercenary_id(dto);
			session.setAttribute("searchList",searchList);
			totalCount=findMercenaryDAOImp.searchFindMercenary_id_TotalCount(dto);
			session.setAttribute("searchListTotalCount",totalCount);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/findMercenaryListT");
		return mav;
	}//search_Free()	

}//HomeController
