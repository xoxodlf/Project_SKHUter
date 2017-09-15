package com.classs.skhuter.council.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.classs.skhuter.notice.controller.VoteController;

@Controller
public class MeetingNoteController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@RequestMapping("/council/meetingNote")
	public String meetinNote(Locale locale, Model model) {
		logger.info("여기는 학생회 회의록!!! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "council/meetingNote.lay";
	}
}
