package com.GoalMate.www;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.GoalMate.www.DAO.Match.MatchDAOImp;
import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.MatchDTO;
import com.GoalMate.www.DTO.StadiumDTO;

@Controller
public class Match {
	
	private static final Logger logger = LoggerFactory.getLogger(Match.class);
	
	@Autowired
	private FileUpService fileUpService;
	@Resource(name="matchDao")
	private MatchDAOImp matchDaoImp;
	
	//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/matchUpCal", method = RequestMethod.GET)
		public String template(Model model,String date,String area) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/matchUpCal - date : "+date+" / area : "+area);
			Map<String, String> map_date=matchDaoImp.dateCutter(date);
			date=map_date.get("year")+"-"+map_date.get("month")+"-"+map_date.get("day");
			
			List<MatchDTO> list=new ArrayList<MatchDTO>();
			if (area==null || area.equals("대구전체")) {//첨들어갈떄 or '대구전체' 일때
				area="대구전체";
				list=matchDaoImp.cal_thisMonth(map_date);
			}else {//특정지역일때
				map_date.put("area", area);
				list=matchDaoImp.cal_thisMonth_thisArea(map_date);
			}//else
			System.out.println("/matchUpCal - list.size : "+list.size());
			for (int i = 0; i < list.size(); i++) {
				System.out.println("list.get(i).getMat_date : "+(i+1)+"] "+list.get(i).getMat_date());
			}
			if (list.size()!=0) {
				model.addAttribute("list", list);
			}
			System.out.println("date : "+date);
			
			List<String> areas=matchDaoImp.getAreas();
			
			model.addAttribute("area", area);
			model.addAttribute("areas", areas);
			model.addAttribute("date", date);
			return "/match/matchUpCal";
		}
	//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/matchUpList", method = RequestMethod.GET)
		public String matchUpList(Model model,String date,String area) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/matchUpList - date before : "+date);
			Map<String, String> map_date=matchDaoImp.dateCutter(date);
			date=map_date.get("year")+"-"+map_date.get("month")+"-"+map_date.get("day");
			System.out.println("/matchUpList - date after : "+date);
			List<MatchDTO> list=new ArrayList<MatchDTO>();
			//대구전체
			if (area.equals("대구전체")) {
				list=matchDaoImp.matchUpList(date);
			}else {//특정'구'
				Map<String, String> map=new HashMap<String, String>();
				map.put("date", date);
				map.put("area", area);
				list=matchDaoImp.matchUpList(map);
			}//else
			
			System.out.println("/matchUpList - list.size : "+list.size());
			if (list.size()!=0) {//model에 추가
				model.addAttribute("list", list);
			}//if
			for (int i = 0; i < list.size(); i++) {//test
				System.out.println("list.get(i).get : "+(i+1)+"] "+list.get(i).getMat_home()+" / "+list.get(i).getMat_away());
			}//for
			
			List<String> areas=matchDaoImp.getAreas();//지역불러오기
			
			model.addAttribute("area", area);
			model.addAttribute("areas", areas);
			model.addAttribute("map_date", map_date);
			model.addAttribute("date", date);			
			return "/match/matchUpList";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/matchUpDetail", method = RequestMethod.GET)
		public String matchUpDetail(Model model,String teamName,String mat_num) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/matchUpDetail - teamName : "+teamName+" / mat_num : "+mat_num);			
			ClubDTO clubDTO=matchDaoImp.getClubDTObyName(teamName);
			int memberCnt=matchDaoImp.getMemberCnt(clubDTO.getClub_id());
			MatchDTO matchDTO=matchDaoImp.getMatchDTO(mat_num);
			
			String clubID_home=matchDaoImp.getClubDTObyName(matchDTO.getMat_home()).getClub_id();
			String clubID_away=matchDaoImp.getClubDTObyName(matchDTO.getMat_away()).getClub_id();
			
			model.addAttribute("clubID_home", clubID_home);
			model.addAttribute("clubID_away", clubID_away);
			model.addAttribute("clubDTO", clubDTO);
			model.addAttribute("memberCnt", memberCnt);
			model.addAttribute("matchDTO", matchDTO);
			return "/match/matchUpDetail";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/challengeAsk", method = RequestMethod.GET)
		public String challengeAsk(Model model,String mat_num,String teamName,String mat_home,HttpSession session) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/challengeAsk - mat_num : "+mat_num+" / teamName : "+teamName+" / mat_home : "+mat_home+" / session.club_id : "+session.getAttribute("club_id"));
			ClubDTO clubDTO=(ClubDTO)matchDaoImp.getClubDTObyId((String)session.getAttribute("club_id"));
			String me_recipient;
			Map<String, String> map=new HashMap<String, String>();
			map.put("mat_num", mat_num);
			map.put("club_name",	clubDTO.getClub_name());
			if (mat_home=="") {//홈에 추가
				//me_recipient ID 찾기 (mat_home)
				String club_name=(String)matchDaoImp.getMatchDTO(mat_num).getMat_away();
				me_recipient=matchDaoImp.getClubDTObyName(club_name).getClub_id();
				//내매치에서 해야됨
//				matchDaoImp.challengeAskHome(map);
			}else{//어웨이에 추가
				//me_recipient ID 찾기 (mat_away)
				String club_name=(String)matchDaoImp.getMatchDTO(mat_num).getMat_home();
				me_recipient=matchDaoImp.getClubDTObyName(club_name).getClub_id();
				//내매치에서 해야됨
//				matchDaoImp.challengeAskAway(map);
			}//else
			
			//상대팀에 메시지 보내기 - 도전자클럽명, 받는클럽ID
			Map<String, String> map_msg=new HashMap<String, String>();
			map_msg.put("mat_num", mat_num);
			map_msg.put("club_id", clubDTO.getClub_id());
			map_msg.put("club_name", clubDTO.getClub_name());
			map_msg.put("me_recipient", me_recipient);
			matchDaoImp.sendChallengeMsg(map_msg);
			//메시지완료 alert 띄우고 제자리로 돌아가기 - 완료
			
			model.addAttribute("teamName", teamName);
			model.addAttribute("mat_num", mat_num);
			model.addAttribute("op", "challengeAskSuc");
			return "/match/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/challengeRegForm", method = RequestMethod.GET)
		public String challengeRegForm(Model model,HttpSession session,String date) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/challengeRegForm - date : "+date);

			//club로그인 안돼있으면 팅군다
			if (session.getAttribute("club_id")==null) {
				model.addAttribute("op", "needLogin");
				return "/match/alert";
			}//if
			
			Map<String, String> map_date=matchDaoImp.dateCutter(date);
			
			List<String> months =new ArrayList<String>();//월 만들기
			for (int i = 0; i < 12; i++) {
				months.add((i+1)+"");
			}
			//일 만들기(연도,달에 따라 다름) => SQL의 LAST_DAY 사용
			List<String> days=matchDaoImp.getDays(map_date);
			//지역 만들기(중구, 동구, 서구, 남구, 달서구, 달성군, 북구, 수성구)
			List<String> areas=matchDaoImp.getAreas();
			//클럽정보가져오기(세션id로)
			ClubDTO clubDTO=matchDaoImp.getClubDTObyId((String)session.getAttribute("club_id"));
			//스타디움리스트 가져오기
			List<StadiumDTO> stadiumList=matchDaoImp.getStadiumList();
			System.out.println("stadiumList.size : "+stadiumList.size());
			
			model.addAttribute("stadiumList", stadiumList);
			model.addAttribute("clubDTO", clubDTO);
			model.addAttribute("areas", areas);
			model.addAttribute("days", days);
			model.addAttribute("months", months);
			model.addAttribute("date", map_date);
			return "/match/challengeRegForm";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/ajax_changeDays", method = RequestMethod.GET)
		public String changeDays(Model model,HttpSession session,String year,String month) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/ajax_changeDays - year : "+year+" / month : "+month);
			Map<String, String> map_date=new HashMap<String, String>();
			map_date.put("year", year);
			map_date.put("month", month);
			//일 만들기(연도,달에 따라 다름) => SQL의 LAST_DAY 사용
			List<String> days_list=matchDaoImp.getDays(map_date);
			int lastDay=days_list.size();
			List<StadiumDTO> sta_list=matchDaoImp.getStadiumList();
			Mat_ReDTO mat_reDTO=matchDaoImp.getMat_ReDTO("1");
			
			model.addAttribute("mat_reDTO", mat_reDTO);//테스트
			model.addAttribute("sta_list", sta_list);//테스트
			model.addAttribute("days_list", days_list);
			model.addAttribute("lastDay", lastDay);
			return "/match/ajax_changeDays2";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/challengeReg", method = RequestMethod.POST)
		public String challengeReg(Model model,MatchDTO dto) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/challengeReg");
			matchDaoImp.challengeReg(dto);
			model.addAttribute("op", "challengeRegSuc");
			return "/match/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/matchUpSearch", method = RequestMethod.GET)
		public String matchUpSearch(Model model,String name,String date) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/matchUpSearch- name : "+name+" / date : "+date);
			Map<String, String> map=new HashMap<String, String>();
			map.put("name", name);
			map.put("date", date);
			List<MatchDTO> list=matchDaoImp.matchUpSearch(map);
			System.out.println("/matchUpSearch - list.size : "+list.size());
			model.addAttribute("list", list);
			model.addAttribute("date", date);
			return "/match/matchUpList";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/myMatch", method = RequestMethod.GET)
		public String myMatch(Model model,HttpSession session) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/myMatch - session.club_id : "+session.getAttribute("club_id"));
			if (session.getAttribute("club_id")==null) {//클럽로그인 아니면 팅군다
				model.addAttribute("op", "needLogin");
				return "/match/alert";
			}else{
				String club_name=((ClubDTO)matchDaoImp.getClubDTObyId((String)session.getAttribute("club_id"))).getClub_name();
				List<Mat_ReDTO> list=matchDaoImp.myMatch(club_name);
				System.out.println("/myMatch - list.size : "+list.size());
				List<Mat_ReDTO> re_list=matchDaoImp.getRe();
				System.out.println("/myMatch - re_list.size : "+re_list.size());
				model.addAttribute("re_list", re_list);
				model.addAttribute("list", list);
				return "/match/myMatch";
			}//else
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/reRegForm", method = RequestMethod.GET)
		public String reRegForm(Model model,String mat_num,String result) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/reRegForm - mat_num : "+mat_num+" / result : "+result);
			if (!result.equals("대기") && !result.equals("경기시작전") && 
					!result.equals("점수미입력") && !result.equals("결과승인대기")){
				result="확정";
			}
			
			MatchDTO matchDTO=(MatchDTO)matchDaoImp.getMatchDTO(mat_num);
			model.addAttribute("mat_reDTO", matchDTO);
			if (matchDTO.getMat_home()!=null) {
				ClubDTO homeDTO=matchDaoImp.getClubDTObyName(matchDTO.getMat_home());
				model.addAttribute("homeDTO", homeDTO);
			}
			if (matchDTO.getMat_away()!=null) {
				ClubDTO awayDTO=matchDaoImp.getClubDTObyName(matchDTO.getMat_away());
				model.addAttribute("awayDTO", awayDTO);
			}
			
			if (result.equals("확정") || result.equals("결과승인대기")) {
				Mat_ReDTO mat_ReDTO=(Mat_ReDTO)matchDaoImp.getMat_ReDTO(mat_num);
				model.addAttribute("mat_reDTO", mat_ReDTO);
			}
			
			model.addAttribute("result", result);
			return "/match/reRegForm";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/reReg", method = RequestMethod.POST)
		public String reReg(Model model,Mat_ReDTO mat_reDTO,MultipartHttpServletRequest mRequest) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/reReg - mat_reDTO.mat_num : "+mat_reDTO.getMat_num());
			System.out.println("/reReg - mat_reDTO.re_home_score : "+mat_reDTO.getRe_home_score());
			System.out.println("/reReg - mat_reDTO.re_away_score : "+mat_reDTO.getRe_away_score());
			List<String> imgs=new ArrayList<String>();
			imgs=fileUpService.fileUploadList(mRequest, "confirmImg");
			for (int i = 0; i < imgs.size(); i++) {
				System.out.println("/reReg - imgs : "+imgs.get(i));
			}//for
			if (imgs.size()==0) {
				mat_reDTO.setRe_path1("");
				mat_reDTO.setRe_path2("");
			}else if (imgs.size()!=0) {
				if (imgs.size()==1) {
					mat_reDTO.setRe_path1(imgs.get(0));
					mat_reDTO.setRe_path2("");
				}else if (imgs.size()==2) {
					mat_reDTO.setRe_path1(imgs.get(0));
					mat_reDTO.setRe_path2(imgs.get(1));
				}//if
			}//if
			matchDaoImp.reReg(mat_reDTO);
			model.addAttribute("mat_num", mat_reDTO.getMat_num());
			model.addAttribute("op", "reRegSuc");
			return "/match/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/myMatchSearch", method = RequestMethod.GET)
		public String myMatchSearch(Model model,HttpSession session,String searchName) {
			System.out.println("-------------------------------------------------------------------------");
			System.out.println("/myMatchSearch - session.club_id : "+session.getAttribute("club_id"));
			if (session.getAttribute("club_id")==null) {//클럽로그인 아니면 팅군다
				model.addAttribute("op", "needLogin");
				return "/match/alert";
			}else{
				String club_name=((ClubDTO)matchDaoImp.getClubDTObyId((String)session.getAttribute("club_id"))).getClub_name();
				
				Map<String, String> map=new HashMap<String, String>();
				map.put("club_name", club_name);
				map.put("searchName", searchName);
				
				List<Mat_ReDTO> list=matchDaoImp.myMatchSearch(map);
				System.out.println("/myMatchSearch - list.size : "+list.size());
				List<Mat_ReDTO> re_list=matchDaoImp.getRe();
				System.out.println("/myMatchSearch - re_list.size : "+re_list.size());
				model.addAttribute("re_list", re_list);
				model.addAttribute("list", list);
				return "/match/myMatch";
			}//else
		}
}//HomeController
