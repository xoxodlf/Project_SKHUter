package com.classs.skhuter.council.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.council.domain.CouncilScheduleDTO;
import com.classs.skhuter.council.service.CouncilScheduleService;
import com.classs.skhuter.notice.controller.VoteController;
import com.classs.skhuter.notice.domain.VoteDTO;

@Controller
@RequestMapping("/council")
public class CouncilScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(CouncilScheduleController.class);
	
	@Inject
	private CouncilScheduleService service;
	
	@RequestMapping("/councilSchedule")
	public String TimeLine(Model model) {
		logger.info("여기는 학생회 일정!!!");
		List<CouncilScheduleDTO> scheduleList =service.listAllSchedule();
		model.addAttribute("scheduleList",scheduleList);
		return "council/councilSchedule.lay";
	}
	@RequestMapping(value="/councilSchedule/registSchedule", method = RequestMethod.POST)
	public String registSchedule(CouncilScheduleDTO registeredSchedule,RedirectAttributes rttr) {
		logger.info(registeredSchedule.toString());
		service.register(registeredSchedule);
		
		rttr.addFlashAttribute("message", "createsuccess");
		return "redirect:/council/councilSchedule";	
	}
	@RequestMapping(value="/councilSchedule/deleteSchedule", method = RequestMethod.POST)
	public String deleteSchedule(@RequestParam("councilScheduleNo") int councilScheduleNo,RedirectAttributes rttr) {
		logger.info(councilScheduleNo+"");
		service.deleteSchedule(councilScheduleNo);
		rttr.addFlashAttribute("message", "deletesuccess");
		return "redirect:/council/councilSchedule";
	}
}
