package com.classs.skhuter.council.controller;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

@Controller
@RequestMapping("/council")
public class CouncilScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(CouncilScheduleController.class);
	
	@Inject
	private CouncilScheduleService service;
	
	private Calendar cal = Calendar.getInstance();
	
	private String Month = (cal.get(Calendar.MONTH)<9?"0"+cal.get(Calendar.MONTH)+1:Integer.toString(cal.get(Calendar.MONTH)+1));
	
	/** 선택한 날짜에 따라서 리스트를 변경하기 위한 Date값 초기값은 현재 시간 */
	public String currentDate = cal.get(Calendar.YEAR)+"-"+Month+"-"+cal.get(Calendar.DATE)+" "+"00"+":"+"00"+":"+"00";
	public String thisMonth = cal.get(Calendar.YEAR)+"-"+(Integer.parseInt(Month)<10?"0"+Integer.parseInt(Month):Integer.parseInt(Month))+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
	public String nextMonth  = cal.get(Calendar.YEAR)+"-"+(Integer.parseInt(Month)+1)+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
	public String currentY = Integer.toString(cal.get(Calendar.YEAR));
	public String currentM = Integer.toString(cal.get(Calendar.MONTH)+1);
	
	
	@RequestMapping("/councilSchedule")
	public String TimeLine(Model model) {
		logger.info("여기는 학생회 일정!!!");
		List<CouncilScheduleDTO> scheduleList =service.listAllSchedule();
		System.out.println(currentDate);
		
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("currentDate",currentDate);
		model.addAttribute("currentY",currentY);
		model.addAttribute("currentM",currentM);
		model.addAttribute("thisMonth",thisMonth);
		model.addAttribute("nextMonth",nextMonth);
		
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
	
	@RequestMapping(value="/councilSchedule/changeDate",method = RequestMethod.POST)
	public String changeDate(String changeYear,String changeMonth,RedirectAttributes rttr,Model model) {
		
		System.out.println("..........changeYear: "+changeYear);
		System.out.println("..........changeMonth: "+changeMonth);
		
		currentY = changeYear;
		currentM = changeMonth;
		
		thisMonth = changeYear+"-"+(Integer.parseInt(changeMonth)<10?"0"+Integer.parseInt(changeMonth):Integer.parseInt(changeMonth))+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
		nextMonth  = changeYear+"-"+(Integer.parseInt(changeMonth)+1)+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
		
		System.out.println("..........thisMonth: "+thisMonth);
		System.out.println("..........nextMonth: "+nextMonth);
		
		model.addAttribute("thisMonth",thisMonth);
		model.addAttribute("nextMonth",nextMonth);
		rttr.addFlashAttribute("message","success");
		
		return "redirect:/council/councilSchedule";
	}
}
