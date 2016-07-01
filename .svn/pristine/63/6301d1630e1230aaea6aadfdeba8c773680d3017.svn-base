package com.GoalMate.www;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.GoalMate.www.DAO.Banner.BannerDAOImp;
import com.GoalMate.www.DAO.Score.ScoreDAOImp;
import com.GoalMate.www.DTO.BannerDTO;
import com.GoalMate.www.DTO.ClubDTO;
import com.GoalMate.www.DTO.Mat_ReDTO;
import com.GoalMate.www.DTO.ScoreDTO;

@Controller
public class Admin {
	@Autowired
	private FileUpService fileUpService;
	@Resource(name="scoreDao")
	private ScoreDAOImp scoreDaoImp;
	@Resource(name="bannerDao")
	private BannerDAOImp bannerDaoImp;
	private static final Logger logger = LoggerFactory.getLogger(Admin.class);
	
		
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerList", method = RequestMethod.GET)
		public String bannerList(Model model) {
			List<BannerDTO> list=bannerDaoImp.bannerList();
			System.out.println("/bannerList - list.size : "+list.size());
			model.addAttribute("list", list);
			return "admin/banner/bannerList";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerOnOff", method = RequestMethod.GET)
		public String bannerOnOff(Model model,String bann_num,String bann_use) {
			System.out.println("/bannerOnOff - dto.bann_use : "+bann_use);
			String page="";
			if (Integer.parseInt(bann_use)==0) {//걍 꺼준다.
				bannerDaoImp.bannerOnOff(bann_num,bann_use);
				page="redirect:/adminMain?page=/bannerList";//MAV로 바꾸기
			}else if (Integer.parseInt(bann_use)==1) {//5개 미만일때만 켜준다. 아니면 경고 후 back
				int max=bannerDaoImp.bann_use_max();
				if (max>=5) {//"최대5개만 on 가능합니다 ㅂㅂ"
					page="admin/banner/alert";
					model.addAttribute("op", "bannerOnOffFail");
				}else {//on 해준다.
					bannerDaoImp.bannerOnOff(bann_num,bann_use);
					page="redirect:/adminMain?page=/bannerList";//MAV로 바꾸기
				}//else
			}//else
			
			return page;
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerDetail", method = RequestMethod.GET)
		public String bannerDetail(Model model,String bann_num) {
			BannerDTO dto=bannerDaoImp.bannerDto(bann_num);
			System.out.println("/bannerDetail - dto.bann_num : "+dto.getBann_num());
			model.addAttribute("dto", dto);
			return "admin/banner/bannerDetail";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerRegForm", method = RequestMethod.GET)
		public String bannerRegForm(Model model) {
			int max_num=bannerDaoImp.bann_num_max();
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString(); 
			model.addAttribute("max_num", max_num);
			model.addAttribute("today", today);
			return "admin/banner/bannerRegForm";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerRegImg", method = RequestMethod.POST)
		public String bannerRegImg(MultipartHttpServletRequest mRequest,Model model,String path) {
			System.out.println("/bannerRegImg - path :  "+path);
			String page="";
			if (path==null) {
				page="/alert";
				model.addAttribute("op", "pathNull");
			}else {
				String img=fileUpService.fileUpload(mRequest, path);
				System.out.println("/bannerRegImg - img :  "+img);
				page="redirect:/bannerRegForm";
				model.addAttribute("img", img);
			}
			return page;
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerReg", method = RequestMethod.POST)
		public String bannerReg(Model model,BannerDTO dto) {
			System.out.println("/bannerReg - dto.max_num : "+dto.getBann_num());
			System.out.println("/bannerReg - dto.bann_path : "+dto.getBann_path());
			bannerDaoImp.bannerReg(dto);
			model.addAttribute("op", "bannerRegSuc");
			return "admin/banner/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerModifyForm", method = RequestMethod.GET)
		public String bannerModifyForm(Model model,String bann_num) {
			BannerDTO dto=bannerDaoImp.bannerDto(bann_num);
			System.out.println("/bannerModifyForm - dto.bann_num : "+dto.getBann_num());
			model.addAttribute("dto", dto);
			return "admin/banner/bannerModifyForm";//@here MAV로 바꾸기
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerImgModify", method = RequestMethod.POST)
		public String bannerImgModify(MultipartHttpServletRequest mRequest,Model model,String path,String bann_num) {
			System.out.println("/bannerImgModify - path :  "+path);
			if (path==null) {
				model.addAttribute("op", "pathNull");
				return "alert";
			}else {
				String img=fileUpService.fileUpload(mRequest, path);
				System.out.println("/bannerImgModify - img :  "+img);
				Map<String, String> map=new HashMap<String, String>();
				map.put("img", img);
				map.put("bann_num", bann_num);
				bannerDaoImp.imgModi(map);
				model.addAttribute("bann_num", bann_num);
				return "redirect:/bannerModifyForm";
			}
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerModify", method = RequestMethod.POST)
		public String bannerModify(Model model,BannerDTO dto) {
			bannerDaoImp.bannerModi(dto);
			model.addAttribute("op", "bannerModiSuc");
			model.addAttribute("bann_num", dto.getBann_num());
			return "admin/banner/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerDel", method = RequestMethod.GET)
		public String bannerDel(Model model,String bann_num) {
			bannerDaoImp.bannerDel(bann_num);
			model.addAttribute("op", "bannerDelSuc");
			return "admin/banner/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/scoreList", method = RequestMethod.GET)
		public String scoreList(Model model) {
			List<Mat_ReDTO> list=scoreDaoImp.scoreList();
			System.out.println("/scoreList - list.size : "+list.size());
			model.addAttribute("list", list);
			return "admin/score/scoreList";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/scoreConfirmForm", method = RequestMethod.GET)
		public String scoreConfirmForm(Model model,int mat_num) {
			Mat_ReDTO mat_reDTO=scoreDaoImp.mat_reDTO(mat_num);
			ClubDTO homeDTO=scoreDaoImp.clubDTO(mat_reDTO.getMat_home());
			ClubDTO awayDTO=scoreDaoImp.clubDTO(mat_reDTO.getMat_away());
			model.addAttribute("mat_reDTO", mat_reDTO);
			model.addAttribute("homeDTO", homeDTO);
			model.addAttribute("awayDTO", awayDTO);
			return "admin/score/scoreConfirmForm";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/scoreConfirm", method = RequestMethod.GET)
		public String scoreConfirm(Model model,String mat_num) {
			System.out.println("/scoreConfirm- mat_num : "+mat_num);
			scoreDaoImp.scoreConfirm(mat_num);
			model.addAttribute("mat_num", mat_num);
			model.addAttribute("op", "scoreConfirmSuc");
			return "admin/score/alert";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/scoreSearch", method = RequestMethod.GET)
		public String scoreSearch(Model model,String name) {
			System.out.println("/scoreSearch- name : "+name);
			List<Mat_ReDTO> list=scoreDaoImp.scoreSearch(name);
			System.out.println("/scoreSearch - list.size : "+list.size());
			model.addAttribute("list", list);
			return "admin/score/scoreList";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/bannerSearch", method = RequestMethod.GET)
		public String bannerSearch(Model model,String name) {
			System.out.println("/bannerSearch- name : "+name);
			List<BannerDTO> list=bannerDaoImp.bannerSearch(name);
			System.out.println("/bannerSearch - list.size : "+list.size());
			model.addAttribute("list", list);
			return "admin/banner/bannerList";
		}
	
}//HomeController
