package com.classs.skhuter.notice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StuScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@RequestMapping("/notice/stuSchedule")
	public String TimeLine(Locale locale, Model model) {
		logger.info("학사 일정", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "notice/stuSchedule.lay";
	}
}
