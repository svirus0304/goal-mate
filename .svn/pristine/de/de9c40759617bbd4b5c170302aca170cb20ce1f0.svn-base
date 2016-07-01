package com.GoalMate.www;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.GoalMate.www.DAO.Rank.RankDAO;
import com.GoalMate.www.DAO.Rank.RankDAOImp;
import com.GoalMate.www.DTO.ClubDTO;

@Controller
public class Rank {
	@Resource(name="rankDao")
	private RankDAOImp rankDAOImp;
	
	private static final Logger logger = LoggerFactory.getLogger(Rank.class);

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/rankList", method = RequestMethod.GET)
	public String rankList(Model model,String cat1,String cat2,String cat3) {
		String areas="전체";
		String types="전체";
		String ages="전체";
		if(cat1!=null){areas=cat1;}
		if(cat2!=null){types=cat2;}
		if(cat3!=null){ages=cat3;}
		List<ClubDTO> list = null;
		ArrayList<Integer> listcount = new ArrayList<Integer>();
		if(!areas.equals("전체")&&!types.equals("전체")&&!ages.equals("전체")){
			list=rankDAOImp.list_area_type_age(areas, types, ages);
			listcount = rankDAOImp.Player_list(list);
		}else if(!areas.equals("전체")&&!types.equals("전체")){
			list=rankDAOImp.list_area_type(areas, types);
			listcount = rankDAOImp.Player_list(list);
		}else if(!areas.equals("전체")&&!ages.equals("전체")){
			list=rankDAOImp.list_area_age(areas, ages);
			listcount = rankDAOImp.Player_list(list);
		}else if(!types.equals("전체")&&!ages.equals("전체")){
			list=rankDAOImp.list_type_age(types, ages);
			listcount = rankDAOImp.Player_list(list);
		}else if(!areas.equals("전체")){
			list=rankDAOImp.list_area(areas);
			listcount = rankDAOImp.Player_list(list);			
		}else if(!types.equals("전체")){
			list=rankDAOImp.list_type(types);
			listcount = rankDAOImp.Player_list(list);			
		}else if(!ages.equals("전체")){
			list=rankDAOImp.list_age(ages);
			listcount = rankDAOImp.Player_list(list);			
		}
		else{
			list = rankDAOImp.list();
			listcount = rankDAOImp.Player_list(list);
		}
		model.addAttribute("cat1",areas);	
		model.addAttribute("cat2",types);	
		model.addAttribute("cat3",ages);	
		model.addAttribute("list",list);
		model.addAttribute("listSize",list.size());
		model.addAttribute("player_list", listcount);
		return "/rank/rankList";
	}
	//-------------------------------------------------------------------------------------
}//HomeController
