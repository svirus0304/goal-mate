package com.GoalMate.www;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Msg {

	private static final Logger logger = LoggerFactory.getLogger(Msg.class);

	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgBox", method = RequestMethod.GET)
	public String msgBox(Model model) {
		return "msgBox";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgSendForm", method = RequestMethod.GET)
	public String msgSendForm(Model model) {
		return "msgSendForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgSend", method = RequestMethod.GET)
	public String msgSend(Model model) {
		return "";//msgBox
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgSendReplyForm", method = RequestMethod.GET)
	public String msgSendReplyForm(Model model) {
		return "msgSendReplyForm";
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgSendReply", method = RequestMethod.GET)
	public String msgSendReply(Model model) {
		return "";//msgBox
	}
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/msgDetail", method = RequestMethod.GET)
	public String msgDetail(Model model) {
		return "msgDetail";
	}

}//HomeController
