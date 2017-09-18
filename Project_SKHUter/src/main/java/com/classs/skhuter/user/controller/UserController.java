package com.classs.skhuter.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@RequestMapping(value="/user/userList", method=RequestMethod.GET)
	public String noticeList(Model model) {
		return "user/userList.lay";
	}
}
