package com.classs.skhuter;

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
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("인덱스 페이지 히사시부리~", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/index.empty";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about (Model model) {
		return "home/about.empty";
	}
	
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String team (Model model) {
		return "home/team.empty";
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna (Model model) {
		return "home/qna.empty";
	}
	
}
