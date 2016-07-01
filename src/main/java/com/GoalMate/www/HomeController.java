package com.GoalMate.www;


import java.util.List;

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

import com.GoalMate.www.DAO.Banner.BannerDAOImp;
import com.GoalMate.www.DTO.BannerDTO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private FileUpService fileUpService;
	
	@Resource(name="bannerDao")
	private BannerDAOImp bannerDaoImp;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "intro";
	}
	
	//////////////////////////////////////////////////////////////////
	//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/template", method = RequestMethod.GET)
		public String template(Model model,String page,String type,HttpSession session) {
			String types=(String)session.getAttribute("type");
			if(types==null){
				types=type;
			}
			if (page==null) {
				page="/main"; //*주의 : 페이지명 앞에 / 꼭 붙여줘야한다.
			}//if
			session.setAttribute("type", "club");
			session.setAttribute("club_id", "test1");
			model.addAttribute("type", "club");
			model.addAttribute("page", page);
			return "template";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/main", method = RequestMethod.GET)
		public String main(Model model,String page) {
			return "main";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/banner", method = RequestMethod.GET)
		public String banner(Model model) {
			List<BannerDTO> list=bannerDaoImp.bannerUseList();
			model.addAttribute("list", list);
			return "special/banner";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
		public String adminMain(Model model,String page) {
			System.out.println("page : "+page);
			if (page==null) {
				page="/scoreList"; //*주의 : 페이지명 앞에 / 꼭 붙여줘야한다.
			}//if
			System.out.println("page : "+page);
			model.addAttribute("page", page);
			return "admin/adminMain";
		}
		//-------------------------------------------------------------------------------------
		@RequestMapping(value = "/fileUp", method = RequestMethod.POST)
		public String fileUp(MultipartHttpServletRequest mRequest,Model model,String path) {
			System.out.println("/fileUp - path :  "+path);
			String page="";
			if (path==null) {
				page="/alert"; //*주의 : 페이지명 앞에 / 꼭 붙여줘야한다.
				model.addAttribute("op", "pathNull");
			}else {
				String img=fileUpService.fileUpload(mRequest, path);
				page="/alert";
				model.addAttribute("op", "fileUpSuc");
			}
			return page;
		}
	
}//HomeController
