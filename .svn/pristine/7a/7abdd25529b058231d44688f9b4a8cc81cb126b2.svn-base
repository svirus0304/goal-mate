package com.GoalMate.www;


import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.Mem.MemDAOImp;
import com.GoalMate.www.DTO.MemDTO;

@Controller
public class Mem {
	
	private static final Logger logger = LoggerFactory.getLogger(Mem.class);
	
	@Resource(name="memDao")
	private MemDAOImp memDAOImp; 
	
	@Autowired
	private MemJoin_FileUpService memJoin_FileUpService;
	
	@Autowired
	private Mem_FileUpChangeService mem_FileUpChangeService;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		return "member/mem/test";
	}//selectJoinForm()
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/selectJoinForm", method = RequestMethod.GET)
	public String selectJoinForm(Model model) {
		return "member/mem/selectJoin";
	}//selectJoinForm()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/templateMemberJoin", method = RequestMethod.GET)
	public String templateMemberJoin(Model model) {
		model.addAttribute("page", "/memberJoinForm");
		return "template";
	}//templateMemberJoin()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.GET)
	public String memberJoinForm(Model model) {
		return "member/mem/memberJoinForm";
	}//memberJoinForm()
	
	@RequestMapping(value = "/memberJoinIdCheck", method = RequestMethod.GET)
	public String memberJoinIdCheck(Model model,String mem_id) {//멤버,클럽 두 개의 테이블 중에 하나라도 0이상 값이 나오면 못만듬
		int check_memTable = memDAOImp.memIdCheck(mem_id);
		int check_clubTable = memDAOImp.clubIdCheck(mem_id);
		boolean flag = false;
		if (check_memTable==0) {//멤버 테이블에서 이미 아이디가 존재하지 않지만
			if (check_clubTable>0) {//멤버 테이블에서 이미 아이디가 존재하지 않지만 클럽테이블에는 아이디가 존재하는 경우 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("mem_id", mem_id);
			}else if (check_clubTable==0) {//멤버 테이블과 클럽테이블 둘 다 아이디가 존재 하지 않는 경우
				model.addAttribute("flag", flag);
				model.addAttribute("mem_id", mem_id);
			}//if
		}else if (check_clubTable==0) {//클럽 테이블에는 아이디가 존재하지 않지만
			if (check_memTable>0) {//멤버 테이블에는 존재하는 경우도 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("mem_id", mem_id);
			}//if
		}//else if
		return "member/mem/idCheck";
	}//joinForm()
	

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/memJoin", method = RequestMethod.POST)
	public ModelAndView memJoin(MultipartHttpServletRequest mRequest,Model model,MemDTO dto) {
		ModelAndView mav = new ModelAndView();
		String mem_path = memJoin_FileUpService.fileUpload(mRequest);
		if (mem_path=="") {
			mem_path="default_Image.jpg";
		}//if
		dto.setMem_path(mem_path);
		int resultVal = memDAOImp.memJoin(dto);
		if (resultVal>0) { //회원계정 생성에 성공 시
			mav.setViewName("redirect:/template?page=/memJoinSuc");
		}else {//오류가 안생기게 했음에도 불구하고 만약에 계정 생성에 실패 했을 때
			mav.setViewName("redirect:/template?page=/memJoinFail");
		}//else
		return mav;
	}//memJoin()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/memJoinSuc", method = RequestMethod.GET)
	public String memJoinSuc(Model model) {
		return "member/mem/memberJoinSuc";
	}//memJoinSuc()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/memJoinFail", method = RequestMethod.GET)
	public String memJoinFail(Model model) {
		return "member/mem/memJoinFail";
	}//memJoinFail()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String myInfo(Model model,HttpSession session,String mem_id) {
		String mem_ids = (String)session.getAttribute("mem_id");
		if (mem_id!=null) {
			if (mem_id.equals("admin")) {
				mem_ids=mem_id;
			}//inner if
		}
		if (mem_ids==null) {//만약에 비로그인상태에서 내정보로 들어갈려고 할 경우 익셉션 처리
			return "member/mem/memPleaseLogin";
		}//else if
		MemDTO dto =  memDAOImp.bringMemberInfo(mem_ids);
		model.addAttribute("dto", dto);
		return "member/mem/myInfo";
	}

	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myInfoCheckPassAgain_ForChangePwd", method = RequestMethod.GET)
	public String myInfoCheckPassAgain_ForChangePwd(Model model,HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		MemDTO dto =  memDAOImp.bringMemberInfo(mem_id);
		model.addAttribute("dto", dto);
		return "member/mem/myInfoCheckPassAgain_ForChangePwd";
	}
	
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePwdFormT", method = RequestMethod.POST)
	public ModelAndView changePwdFormT(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/changePwdForm");
		return mav;
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePwdForm", method = RequestMethod.GET)
	public String changePwdForm(Model model,HttpSession session) {
		return "member/mem/myInfo_changePwdForm";
	}
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public ModelAndView changePwd(Model model,HttpSession session,MemDTO dto) {
		String mem_id = (String)session.getAttribute("mem_id");
		dto.setMem_id(mem_id);
		ModelAndView mav = new ModelAndView();
		int resultVal = memDAOImp.memchangePassword(dto);
		if (resultVal>0) {//패스워드 변경에 성공하였다면
			mav.setViewName("redirect:template?page=/changePasswordSuc");
		}else {//혹시나 실패했다면
			mav.setViewName("redirect:template?page=/changePasswordFail");
		}//else
		return mav;
	}//changePwd()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePasswordSuc", method = RequestMethod.GET)
	public String changePasswordSuc(Model model) {
		return "member/mem/memChangePasswordSuc";
	}//changePasswordSuc()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePasswordFail", method = RequestMethod.GET)
	public String changePasswordFail(Model model) {
		return "member/mem/memChangePasswordFail";
	}//changePasswordFail()
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myInfoPicCh", method = RequestMethod.POST)
	public ModelAndView myInfoPicCh(MultipartHttpServletRequest mRequest,Model model,MemDTO dto) {
		String uploadPath = "C:\\Java\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\mem\\";
		File delete = new File(uploadPath+dto.getMem_path());
		if (delete.exists()) {
			delete.delete();
		}//if
		
		ModelAndView mav = new ModelAndView();
		String mem_path = mem_FileUpChangeService.fileUpload(mRequest);
		dto.setMem_path(mem_path);
		int resultVal = memDAOImp.changePic(dto);
		if (resultVal>0) { 
			mav.setViewName("redirect:/template?page=/myInfo");
		}else {
			mav.setViewName("redirect:/template?page=/changePicFail");
		}//else
		return mav;
	}//changePasswordFail()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changePicFail", method = RequestMethod.GET)
	public String changePicFail(Model model) {
		return "member/mem/changePicFail";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myInfoModifyForm", method = RequestMethod.GET)
	public String myInfoModifyForm(Model model) {
		return "myInfoModifyForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myInfoModify", method = RequestMethod.GET)
	public String myInfoModify(Model model) {
		return "";//myInfo
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myMerDetail", method = RequestMethod.GET)
	public String myMerDetail(Model model) {
		return "myMerDetail";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myMerModifyForm", method = RequestMethod.GET)
	public String myMerModifyForm(Model model) {
		return "myMerModifyForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myMerModify", method = RequestMethod.GET)
	public String myMerModify(Model model) {
		return "";//myMerDetail
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/myMerDelete", method = RequestMethod.GET)
	public String myMerDelete(Model model) {
		return "";//myInfo
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/memPleaseLogin", method = RequestMethod.GET)
	public String memPleaseLogin(Model model) {
		return "member/mem/memPleaseLogin";
	}	
	
}//HomeController
