package com.GoalMate.www;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.Mercenary.MerDAOImp;
import com.GoalMate.www.DAO.Rank.RankDAOImp;
import com.GoalMate.www.DTO.MercenaryDTO;

@Controller
public class Mercenary {
	@Resource(name="merDao")
	private MerDAOImp merDAOImp;
	private static final Logger logger = LoggerFactory.getLogger(Mercenary.class);
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merRegForm", method = RequestMethod.GET)
	public String merRegForm(Model model) {
		return "mercenaryRegForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merReg", method = RequestMethod.GET)
	public String merReg(Model model) {
		return "";//mercenaryList
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merList", method = RequestMethod.GET)
	public String merList(Model model,String cat1,String cat2,String cat3,String nowpage) {
		int rowsize = 12;//최대개수
		int block= 5; //최대개수 
		int pages = 1; //현재 페이지
		String areas = "전체";
		String positions = "전체";
		String foots = "전체";
		if(cat1!=null){areas=cat1;}
		if(cat2!=null){positions=cat2;}
		if(cat2!=null){foots=cat3;}
		if(nowpage!=null){pages=Integer.parseInt(nowpage);}
		int starts = (pages*rowsize) - (rowsize-1); // 해당페이지에서 시작번호(step2)
		int ends = (pages*rowsize); // 해당페이지에서 끝번호(step2)
		int startPage = (pages/(block+1)*block)+1;//시작페이지
		int endPage =((pages-1)/block*block)+block;//끝페이지
		List<MercenaryDTO> list = null;
		int count=0;
		
		if(!areas.equals("전체")&&!positions.equals("전체")&&!foots.equals("전체")){
			list = merDAOImp.listPage_area_position_foot(starts, ends, cat1, cat2, cat3);
			count = merDAOImp.listPageAll_area_position_foot(cat1, cat2, cat3);
		}else if(!areas.equals("전체")&&!positions.equals("전체")){
			list = merDAOImp.listPage_area_position(starts, ends, cat1, cat2);
			count = merDAOImp.listPageAll_area_position(cat1, cat2);
		}else if(!areas.equals("전체")&&!foots.equals("전체")){
			list = merDAOImp.listPage_area_foot(starts, ends, cat1, cat3);
			count = merDAOImp.listPageAll_area_foot(cat1, cat3);
		}else if(!positions.equals("전체")&&!foots.equals("전체")){
			list = merDAOImp.listPage_position_foot(starts, ends, cat2, cat3);
			count = merDAOImp.listPageAll_position_foot(cat2, cat3);
		}else if(!areas.equals("전체")){
			list = merDAOImp.listPage_area(starts, ends, cat1);
			count = merDAOImp.listPageAll_area(cat1);
		}else if(!positions.equals("전체")){
			list = merDAOImp.listPage_position(starts, ends, cat2);
			count = merDAOImp.listPageAll_position(cat2);
		}else if(!foots.equals("전체")){
			list = merDAOImp.listPage_foot(starts, ends, cat3);
			count = merDAOImp.listPageAll_foot(cat3);
		}
		else{
			list = merDAOImp.listPage(starts, ends);
			count = merDAOImp.listPageAll();
		}
		int allPage = count/rowsize+1;//모든 페이지
		
		if(allPage==0){
			allPage=1;
		}else if(count%rowsize==0){
			allPage-=1;
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pages",pages);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("allPage",allPage);
		
		model.addAttribute("cat1",areas);
		model.addAttribute("cat2",positions);
		model.addAttribute("cat3",foots);
		model.addAttribute("list",list);
		return "/mercenary/mercenaryList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merDetail", method = RequestMethod.GET)
	public String merDetail(Model model,String mer_id) {
		MercenaryDTO dto = merDAOImp.details(mer_id);
		model.addAttribute("dto",dto);
		return "/mercenary/mercenaryDetail";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merEditForm", method = RequestMethod.GET)
	public String merEditForm(Model model) {
		return "mercenaryEditForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merEdit", method = RequestMethod.GET)
	public String merEdit(Model model) {
		return "";//mercenaryList
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/merDel", method = RequestMethod.GET)
	public String merDel(Model model) {
		return "";//mercenaryList
	}

}//HomeController
