package com.classs.skhuter.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model) {
		return "notice/noticeList.lay";
	}
	
	@RequestMapping(value="/notice/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(Model model) {
		return "notice/noticeDetail.lay";
	}
	
	@RequestMapping(value="/notice/noticeForm", method=RequestMethod.GET)
	public String noticeForm(Model model) {
		return "notice/noticeForm.lay";
	}
}
