package com.classs.skhuter.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.notice.domain.StuScheduleDTO;
import com.classs.skhuter.notice.service.StuScheduleService;

@Controller
@RequestMapping("/notice")
public class StuScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Inject
	private StuScheduleService service;
	
	@RequestMapping("/stuSchedule")
	public String TimeLine(Model model) {
		logger.info("학사 일정");
		List<StuScheduleDTO> scheduleList =service.listAllSchedule();
		model.addAttribute("scheduleList",scheduleList);
		
		return "notice/stuSchedule.lay";
	}
	
	@RequestMapping(value="/stuSchedule/registSchedule", method = RequestMethod.POST)
	public String registSchedule(StuScheduleDTO registeredSchedule,RedirectAttributes rttr) {
		logger.info(registeredSchedule.toString());
		service.register(registeredSchedule);
		
		rttr.addFlashAttribute("message", "createsuccess");
		return "redirect:/notice/stuSchedule";	
	}
	
	@RequestMapping(value="/stuSchedule/deleteSchedule", method = RequestMethod.POST)
	public String deleteSchedule(@RequestParam("schoolScheduleNo") int schoolScheduleNo,RedirectAttributes rttr) {
		logger.info(schoolScheduleNo+"");
		service.deleteSchedule(schoolScheduleNo);
		rttr.addFlashAttribute("message", "deletesuccess");
		return "redirect:/notice/stuSchedule";
	}
}
