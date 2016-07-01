package com.GoalMate.www;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ImageCollection {

	private static final Logger logger = LoggerFactory.getLogger(ImageCollection.class);

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/imageList", method = RequestMethod.GET)
	public String imageList(Model model) {
		return "imageList";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/imageListDetail", method = RequestMethod.GET)
	public String imageListDetail(Model model) {
		return "imageListDetail";
	}


}//HomeController
