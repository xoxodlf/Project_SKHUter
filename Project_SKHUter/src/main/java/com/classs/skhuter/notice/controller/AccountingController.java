package com.classs.skhuter.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountingController {
	
	@RequestMapping(value="/notice/accountingList", method=RequestMethod.GET)
	public String accountingList(Model model) {
		return "notice/accountingList.lay";
	}
	
	@RequestMapping(value="/notice/accountingForm", method=RequestMethod.GET)
	public String accountingForm(Model model) {
		return "notice/accountingForm.lay";
	}
}
