package com.GoalMate.www;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.GoalMate.www.DAO.Club.ClubDAO;
import com.GoalMate.www.DAO.Club.ClubDAOImp;
import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.PlayerDTO;

@Controller
public class Club {
	@Resource(name="clubDao")
	private ClubDAOImp clubDAOImp;
									
	private static final Logger logger = LoggerFactory.getLogger(Club.class);

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubList", method = RequestMethod.GET)
	public String clubList(Model model,String patterns,String finds,String nowpage) {
		System.out.println("-----------------------------------------------------------------");
		System.out.println("패턴 값:"+patterns);
		int rowsize = 2;//최대개수
		int block= 5; //최대개수 
		int page = 1; //현재 페이지
		if(nowpage!=null){
			page=Integer.parseInt(nowpage);
			System.out.println("page : "+page);
		}
		int starts = (page*rowsize) - (rowsize-1); // 해당페이지에서 시작번호(step2)
		int ends = (page*rowsize); // 해당페이지에서 끝번호(step2)
		int startPage = (page/(block+1)*block)+1;//시작페이지
		int endPage =((page-1)/block*block)+block;//끝페이지
		List<ClubDTO> listSize = null;
		List<ClubDTO> list = null;
		
		if(patterns==null||patterns.equals("1")){
		listSize=clubDAOImp.list();
		list=clubDAOImp.listPage(starts,ends);
		}
		else if(patterns.equals("10")||patterns.equals("20")||patterns.equals("30")||patterns.equals("40")){
			listSize = clubDAOImp.list_age(patterns+"대");
			list=clubDAOImp.list_age_Page(starts,ends,patterns+"대");
		}else if(patterns.equals("50")){
			listSize = clubDAOImp.list_age(patterns+"대 이상");	
			list=clubDAOImp.list_age_Page(starts,ends,patterns+"대 이상");
	
		}else if(patterns.equals("60")){//팀명
			System.out.println("확인 확인");
			listSize = clubDAOImp.list_club(finds);	
			list=clubDAOImp.list_club_Page(starts,ends,finds);
			
		}else if(patterns.equals("70")){//지역
			listSize = clubDAOImp.list_area(finds);	
			list=clubDAOImp.list_area_Page(starts,ends,finds);
		}
		
		int allPage = listSize.size()/rowsize+1;//모든 페이지
		if(allPage==0){
			allPage=1;
		}else if(listSize.size()%rowsize==0){
			allPage-=1;
		}
		System.out.println("불러온 리스트 사이즈"+list.size());
		System.out.println("총 리스트 사이즈"+listSize.size());
		System.out.println("시작 번호"+starts);
		System.out.println("끝 번호"+ends);
		System.out.println("시작 페이지 : "+startPage);
		System.out.println("끝 페이지: "+endPage);
		System.out.println("모든 페이지수 : "+allPage);
		
		model.addAttribute("list",list);
		model.addAttribute("size",listSize.size());			
		model.addAttribute("page",page);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("allPage",allPage);
		if(patterns!=null){
			model.addAttribute("patterns",patterns);
		}//검색
		
		if(finds!=null){
			model.addAttribute("finds",finds);
		}//내용
		
		return "/club/clubList";
	}


	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/clubDetail", method = RequestMethod.GET)
	public String clubDetail(Model model,String club_id) {
		ClubDTO dto = clubDAOImp.findClub(club_id);
		List<PlayerDTO> list = clubDAOImp.list_player(club_id);
		int player_number = 0;
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
		if(list!=null){
			player_number=list.size();
		}
		model.addAttribute("number",player_number);
		return "/club/clubDetail";
	}

}//HomeController