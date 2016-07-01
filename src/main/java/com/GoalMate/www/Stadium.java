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

import com.GoalMate.www.DAO.Stadium.StaDAOImp;
import com.GoalMate.www.DTO.StadiumDTO;

@Controller
public class Stadium {

	private static final Logger logger = LoggerFactory.getLogger(Stadium.class);
	@Resource(name="staDao")
	private StaDAOImp staDAOImp; 
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staList", method = RequestMethod.GET)
	public String staList(Model model) {
		List<StadiumDTO>list = staDAOImp.staList();
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/middleList", method = RequestMethod.GET)
	public String middleList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.middleList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/westList", method = RequestMethod.GET)
	public String westList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.westList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/southList", method = RequestMethod.GET)
	public String southList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.southList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/dalseoList", method = RequestMethod.GET)
	public String dalseoList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.dalseoList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/northList", method = RequestMethod.GET)
	public String northList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.northList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/eastList", method = RequestMethod.GET)
	public String eastList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.eastList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/dalsungList", method = RequestMethod.GET)
	public String dalsungList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.dalsungList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/suseongList", method = RequestMethod.GET)
	public String suseongList(Model model, String st_area) {
		List<StadiumDTO>list = staDAOImp.suseongList(st_area);
		model.addAttribute("list", list);
		return "stadium/stadiumList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staDetail", method = RequestMethod.GET)
	public String staDetail(Model model, String st_num ) {
		StadiumDTO staDto = staDAOImp.staDetailList(st_num);
		model.addAttribute("staDto", staDto);
		return "stadium/stadiumDetail";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staRegForm", method = RequestMethod.GET)
	public String staRegForm(Model model) {
		return "stadium/stadiumRegForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staReg", method = RequestMethod.GET)
	public String staReg(Model model) {
		
		return "";//stadiumList
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staEditForm", method = RequestMethod.GET)
	public String staEditForm(Model model) {
		return "stadiumEditForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staEdit", method = RequestMethod.GET)
	public String staEdit(Model model) {
		return "";//stadiumList
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/staDel", method = RequestMethod.GET)
	public String staDel(Model model) {
		return "";//stadiumList
	}
	

}//HomeController
