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

/**
 * 메인 컨트롤러 (Home Controller)
 * 
 * @패키지 : com.classs.skhuter
 * @파일명 : HomeController.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 09. 13. 
 *
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 처음 localhost 화면
	 *
	 * @Method Name : home
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("인덱스 페이지 히사시부리~", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/index.empty";
	}
	
	/**
	 * 스쿠터 서비스 소개 페이지
	 *
	 * @Method Name : about
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about (Model model) {
		return "home/about.empty";
	}

	/**
	 * 팀원 소개 페이지
	 *
	 * @Method Name : team
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String team (Model model) {
		return "home/team.empty";
	}

	/**
	 * Q & A 페이지
	 *
	 * @Method Name : qna
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna (Model model) {
		return "home/qna.empty";
	}
	
	/**
	 * 로그인 후 홈화면 페이지
	 *
	 * @Method Name : home
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home (Model model) {
		return "home/home.lay";
	}
	
}
