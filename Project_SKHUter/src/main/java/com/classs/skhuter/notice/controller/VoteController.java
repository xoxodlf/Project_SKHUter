package com.classs.skhuter.notice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice")
public class VoteController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@RequestMapping("/voteList")
	public String vote(Locale locale, Model model) {
		logger.info("투표내역입장");
		
		
		return "notice/vote.lay";
	}
	
	@RequestMapping(value="/vote/voteForm", method=RequestMethod.GET)
	public String boardList(Model model) {
		return "notice/voteForm.lay";
	}
	
}
