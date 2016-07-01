package com.GoalMate.www;


import java.io.File;  
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.ClubMem.ClubMemDAOImp;
import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.MemDTO;
import com.GoalMate.www.DTO.PlayerDTO;


@Controller
public class ClubMem {

	private static final Logger logger = LoggerFactory.getLogger(ClubMem.class);

	@Resource(name="clubMemDao")
	private ClubMemDAOImp clubMemDAOImp;
	
	@Autowired
	private ClubJoin_FileUpService clubJoin_FileUpService;
	
	@Autowired
	private ClubJoin_FileUpService clubJoin_FileUpChangeService;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/templateClubJoin", method = RequestMethod.GET)
	public String templateClubJoin(Model model) {
		model.addAttribute("page", "/clubJoinForm");
		return "template";
	}//templateClubJoin()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoinForm", method = RequestMethod.GET)
	public String clubJoinForm(Model model) {
		return "member/clubmem/clubJoinForm";
	}//clubJoinForm()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoinIdCheck", method = RequestMethod.GET)
	public String clubJoinIdCheck(Model model,String club_id) {//멤버와 클럽에서 같은 아이디가 있으면 안되므로 둘 다 검사
		int check_memTable = clubMemDAOImp.memIdChecks(club_id);
		int check_clubTable = clubMemDAOImp.clubIdChecks(club_id);
		boolean flag = false;
		if (check_clubTable==0) {//클럽 테이블에서 아이디가 존재하지 않지만
			if (check_memTable>0) {//클럽 테이블에서 이미 아이디가 멤버 테이블에 아이디가 존재하는 경우 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("club_id", club_id);
			}else if (check_memTable==0) {//클럽 테이블과 멤버테이블 둘 다 아이디가 존재 하지 않는 경우 만든다
				model.addAttribute("flag", flag);
				model.addAttribute("club_id", club_id);
			}//if
		}else if (check_memTable==0) {//멤버 테이블에는 아이디가 존재하지 않지만
			if (check_clubTable>0) {//클럽 테이블에는 존재하는 경우도 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("club_id", club_id);
			}//if
		}//else if
		return "member/clubmem/clubIdCheck";
	}//clubJoinIdCheck()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoinNameCheck", method = RequestMethod.GET)
	public String clubJoinNameCheck(Model model,String club_name) {
		int check_clubTable = clubMemDAOImp.clubNameCheck(club_name);
		boolean flag = false;
		if (check_clubTable==0) {//클럽 테이블에서 이름 중복이 안되는 경우 만든다
				model.addAttribute("flag", flag);
				model.addAttribute("club_name", club_name);
				
		}else if (check_clubTable>0) {//클럽 테이블에서 이름 중복이 되는 경우 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("club_name", club_name);
		}//else if
		return "member/clubmem/clubNameCheck";		
	}//clubJoinNameCheck()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubChangeInfoNameCheck", method = RequestMethod.GET)
	public String clubChangeInfoNameCheck(Model model,String club_name) {
		int check_clubTable = clubMemDAOImp.clubNameCheck(club_name);
		boolean flag = false;
		if (check_clubTable==0) {//클럽 테이블에서 이름 중복이 안되는 경우 만든다
				model.addAttribute("flag", flag);
				model.addAttribute("club_name", club_name);
				
		}else if (check_clubTable>0) {//클럽 테이블에서 이름 중복이 되는 경우 못만들게 해야함
				flag = true;
				model.addAttribute("flag", flag);
				model.addAttribute("club_name", club_name);
		}//else if
		return "member/clubmem/clubChangeInfoNameCheck";		
	}//clubJoinNameCheck()	
	
	

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoin", method = RequestMethod.POST)
	public ModelAndView clubJoin(MultipartHttpServletRequest mRequest,Model model,ClubDTO dto) {
		ModelAndView mav = new ModelAndView();
		String club_path = clubJoin_FileUpService.fileUpload(mRequest);
		if (club_path=="") {
			club_path="default_emblem.png";
		}//if
		dto.setClub_path(club_path);
		int resultVal = clubMemDAOImp.clubJoin(dto);
		if (resultVal>0) { //클럽계정 생성에 성공 시
			mav.setViewName("redirect:/template?page=/clubJoinSuc");
		}else {//오류가 안생기게 했음에도 불구하고 만약에 계정 생성에 실패 했을 때
			mav.setViewName("redirect:/template?page=/clubJoinFail");
		}//else
		return mav;
	}//ClubJoin_FileUpService()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoinSuc", method = RequestMethod.GET)
	public String clubJoinSuc(Model model) {
		return "member/clubmem/clubJoinSuc";
	}//memJoinSuc()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubJoinFail", method = RequestMethod.GET)
	public String clubJoinFail(Model model) {
		return "member/clubmem/clubJoinFail";
	}//memJoinFail()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubInfo", method = RequestMethod.GET)
	public String clubInfo(Model model,HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		if (club_id==null) {
			return "member/clubmem/clubPleaseLogin";
		}
		ClubDTO dto = clubMemDAOImp.bringClubInfo(club_id);
		List<PlayerDTO> list = clubMemDAOImp.bringClubMemberInfoList(club_id);
		for (int i = 0; i < list.size(); i++) {//몸무게와 키를 합산하여 피지컬 점수를 계산하기 위해서 쓰는 반복문
			int physical_score=0;
			int pl_increase=0;
			int pl_weight=0;
			pl_increase = list.get(i).getPl_increase();
			pl_weight = list.get(i).getPl_weight();
			if (pl_increase<170) {//키 점수 계산
				physical_score+=1;
			}else if (pl_increase>=170) {
				physical_score+=2;
			}//else if
			
			if (pl_weight<50) {//몸무게 점수 계산
				physical_score+=1;
			}else if (pl_weight>=50&&pl_weight<70) {
				physical_score+=2;
			}else if (pl_weight>=70) {
				physical_score+=3;
			}//if
			list.get(i).setPl_increase(physical_score);
		}//for
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberList", list);
		return "member/clubmem/clubInfo";
	}//clubInfo()
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubInfoPicCh", method = RequestMethod.POST)
	public ModelAndView clubInfoPicCh(MultipartHttpServletRequest mRequest,Model model,ClubDTO dto) {
		String uploadPath = "C:\\Java\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\GoalMate\\resources\\img\\emblem\\";
		File delete = new File(uploadPath+dto.getClub_path());
		if (delete.exists()) {
			delete.delete();
		}//if
		
		ModelAndView mav = new ModelAndView();
		String club_path = clubJoin_FileUpChangeService.fileUpload(mRequest);
		dto.setClub_path(club_path);
		int resultVal = clubMemDAOImp.changeClubPic(dto);
		if (resultVal>0) { 
			mav.setViewName("redirect:/template?page=/clubInfo");
		}else {
			mav.setViewName("redirect:/template?page=/changeClubPicFail");
		}//else
		return mav;
	}//clubInfoPicCh()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubInfoCheckPassAgain_ForChangePwd", method = RequestMethod.GET)
	public String clubInfoCheckPassAgain_ForChangePwd(Model model,HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		ClubDTO dto =  clubMemDAOImp.bringClubInfo(club_id);
		model.addAttribute("dto", dto);
		return "member/clubmem/clubInfoCheckPassAgain_ForChangePwd";
	}//clubInfoCheckPassAgain_ForChangePwd()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubChangeInfoCheckPassAgain_ForChangeCInfo", method = RequestMethod.GET)
	public String clubChangeInfoCheckPassAgain_ForChangeCInfo(Model model,HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		ClubDTO dto =  clubMemDAOImp.bringClubInfo(club_id);
		model.addAttribute("dto", dto);
		return "member/clubmem/clubInfoCheckPassAgain_ForChangeCInfo";
	}//clubInfoCheckPassAgain_ForChangeCInfo()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubPwdFormT", method = RequestMethod.POST)
	public ModelAndView changeClubPwdFormT(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/changeClubPwdForm");
		return mav;
	}///changeClubPwdFormT()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubInfoT", method = RequestMethod.POST)
	public ModelAndView changeClubInfoT(Model model,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template?page=/changeClubInfoForm");
		return mav;
	}///changeClubPwdFormT()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubPwdForm", method = RequestMethod.GET)
	public String changeClubPwdForm(Model model,HttpSession session) {
		return "member/clubmem/clubInfo_changePwdForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubInfoForm", method = RequestMethod.GET)
	public String changeClubInfoForm(Model model,HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		ClubDTO dto =  clubMemDAOImp.bringClubInfo(club_id);
		model.addAttribute("dto", dto);
		return "member/clubmem/clubInfo_changeInfoForm";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubPwd", method = RequestMethod.POST)
	public ModelAndView changeClubPwd(Model model,HttpSession session,ClubDTO dto) {
		String club_id = (String)session.getAttribute("club_id");
		dto.setClub_id(club_id);
		ModelAndView mav = new ModelAndView();
		int resultVal = clubMemDAOImp.clubChangePassword(dto);
		if (resultVal>0) {//패스워드 변경에 성공하였다면
			mav.setViewName("redirect:template?page=/changeClubPasswordSuc");
		}else {//혹시나 실패했다면
			mav.setViewName("redirect:template?page=/changeClubPasswordFail");
		}//else
		return mav;
	}//changePwd()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubInfo", method = RequestMethod.POST)
	public ModelAndView changeClubInfo(Model model,HttpSession session,ClubDTO dto) {
		String club_id = (String)session.getAttribute("club_id");
		dto.setClub_id(club_id);
		ModelAndView mav = new ModelAndView();
		int resultVal = clubMemDAOImp.clubChangeInfo(dto);
		if (resultVal>0) {//클럽정보 변경에 성공하였다면
			mav.setViewName("redirect:template?page=/changeClubInfoSuc");
		}else {//혹시나 실패했다면
			mav.setViewName("redirect:template?page=/changeClubInfoFail");
		}//else
		return mav;
	}//changePwd()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubPasswordSuc", method = RequestMethod.GET)
	public String changeClubPasswordSuc(Model model) {
		return "member/clubmem/clubChangePasswordSuc";
	}//changeClubPasswordSuc()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "//changeClubPasswordFail", method = RequestMethod.GET)
	public String changeClubPasswordFail(Model model) {
		return "member/clubmem/clubChangePasswordFail";
	}//changeClubPasswordFail()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubInfoSuc", method = RequestMethod.GET)
	public String changeClubInfoSuc(Model model) {
		return "member/clubmem/clubChangeInfoSuc";
	}//changeClubInfoSuc()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/changeClubInfoFail", method = RequestMethod.GET)
	public String changeClubInfoFail(Model model) {
		return "member/clubmem/clubChangeInfoFail";
	}//changeClubInfoFail()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMemberAddIntro", method = RequestMethod.GET)
	public String clubMemberAddIntro(Model model) {
		return "member/clubmem/clubMemberAddIntro";
	}//clubMemberAddIntro()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMembersDelete", method = RequestMethod.POST)
	public ModelAndView clubMemberDelete(Model model,HttpServletRequest request) {
		String[] deletePlayers= request.getParameterValues("players");
		for (int i = 0; i < deletePlayers.length; i++) {
			clubMemDAOImp.deletePlayers(deletePlayers[i]);
		}//for
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:template?page=/clubInfo");
		return mav;
	}//clubMemberDelete()
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/deleteClubPlayer", method = RequestMethod.GET)
	public ModelAndView deleteClubPlayer(Model model,String num) {
		clubMemDAOImp.deletePlayer(num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:template?page=/clubInfo");
		return mav;
	}//deleteClubPlayer()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMemberAddForm", method = RequestMethod.GET)
	public String clubMemberAddForm(Model model) {
		return "member/clubmem/clubMemberAddForm";
	}//clubMemberAddForm()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMemberAdd", method = RequestMethod.POST)
	public ModelAndView clubMemberAdd(Model model,HttpServletRequest request,HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		String[] pl_name = request.getParameterValues("pl_name");
		String[] pl_position = request.getParameterValues("pl_position");
		String[] pl_increase = request.getParameterValues("pl_increase");
		String[] pl_weight = request.getParameterValues("pl_weight");
		String[] pl_dribble = request.getParameterValues("pl_dribble");
		String[] pl_speed = request.getParameterValues("pl_speed");
		for (int i = 0; i < pl_name.length; i++) {
			PlayerDTO dto = new PlayerDTO();
			dto.setPl_name(pl_name[i]);
			dto.setPl_position(pl_position[i]);
			dto.setPl_increase(Integer.parseInt(pl_increase[i]));
			dto.setPl_weight(Integer.parseInt(pl_weight[i]));
			dto.setPl_dribble(Integer.parseInt(pl_dribble[i]));
			dto.setPl_speed(Integer.parseInt(pl_speed[i]));
			dto.setClub_id(club_id);
			clubMemDAOImp.clubMemberAdd(dto);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:template?page=/clubInfo");
		return mav;
	}//clubMemberAdd()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMembersModifyForm", method = RequestMethod.GET)
	public String clubMembersModifyForm(Model model,String num) {
		PlayerDTO dto = clubMemDAOImp.clubMemberInfo(num);
		model.addAttribute("dto", dto);
		return "member/clubmem/clubMembersModifyForm";
	}//clubMembersModifyForm()
	
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubMemberModify", method = RequestMethod.POST)
	public ModelAndView clubMemberModify(Model model,PlayerDTO dto, HttpSession session) {
		String club_id = (String)session.getAttribute("club_id");
		dto.setClub_id(club_id);
		clubMemDAOImp.clubMemberModify(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:template?page=/clubInfo");
		return mav;
	}//clubMemberModify()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubInfoMatchHistory", method = RequestMethod.GET)
	public String clubInfoMatchHistory(Model model) {
		return "clubInfoMatchHistory";
	}//clubInfoMatchHistory()
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubInfoMatchResult", method = RequestMethod.GET)
	public String clubInfoMatchResult(Model model) {
		return "";//clubInfoMatchHistory
	}

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubPleaseLogin", method = RequestMethod.GET)
	public String memPleaseLogin(Model model) {
		return "member/clubmem/clubPleaseLogin";
	}		
	
}//ClubMemController
