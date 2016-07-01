package com.GoalMate.www;


import javax.annotation.Resource; 
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.LogIO.LogIoDAOImp;

@Controller
public class LogIO {

	private static final Logger logger = LoggerFactory.getLogger(LogIO.class);

	@Resource(name="logIoDao")
	private LogIoDAOImp logIoDAOImp;
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Model model) {//로그인 폼 호출
		return "member/logIO/login";
	}//loginForm()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.POST) //아이디와 비밀번호가 있기때문에 POST방식!!
	public ModelAndView login(Model model,String mem_id,String mem_pw,String loginType,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String type="";
		if (loginType.equals("member")) {//loginType이 member의 경우
			int checkResult_member = logIoDAOImp.loginCheckMemberTable(mem_id,mem_pw);
			if (checkResult_member>0) {//로그인 성공 시
				if (checkResult_member>0&&checkResult_member!=7) {//일반회원이 로그인 한 경우
					type="user";//로그인 타입을 유저로 준다.
					session.setAttribute("mem_id", mem_id);//세션 부여
					session.setAttribute("type",type);
					mav.setViewName("redirect:/templates");
					return mav;//로그인 성공 후 관리자 메인 페이지로 이동
				}else if (checkResult_member==7) {//관리자가 로그인 한 경우
					type="admin";//로그인 타입을 유저로 준다.
					session.setAttribute("mem_id", mem_id);//세션 부여
					session.setAttribute("type",type);
					mav.setViewName("redirect:/templates");
					return mav;//로그인 성공 후 관리자 메인 페이지로 이동
				}//else if
			}else {//로그인 실패 시
				mav.setViewName("redirect:/loginFail");
				return mav;//로그인 실패 페이지로 이동
			}//else
		}else if (loginType.equals("club")) {//loginType이 club의 경우
			String club_id="", club_pw="";
			club_id=mem_id;
			club_pw=mem_pw;
			int checkResult_club = logIoDAOImp.loginCheckClubTable(club_id,club_pw);
			if (checkResult_club>0) {//로그인 성공 시
				type="club";//로그인 타입을 클럽으로 준다.
				session.setAttribute("club_id", club_id);//세션부여
				session.setAttribute("type",type);
				mav.setViewName("redirect:/templates");
				return mav;//로그인 성공 후 관리자 메인 페이지로 이동
			}else {//로그인 실패 시
				mav.setViewName("redirect:/loginFail");
				return mav;//로그인 실패 페이지로 이동
			}//else
		}//else if
		
		return mav;
	}//ModelAndView login()
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "member/logIO/logout";
	}//logout()
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/loginFail", method = RequestMethod.GET)
	public String loginFail(Model model) {
		return "member/logIO/logFail";
	}//loginFail()
	//-------------------------------------------------------------------------------------

	@RequestMapping(value = "/templates", method = RequestMethod.GET)
	public ModelAndView templates(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/template");
		return mav;//로그인 성공 후 템플릿으로 이동
	}//templates()
	//-------------------------------------------------------------------------------------

}//LogIO Controller
