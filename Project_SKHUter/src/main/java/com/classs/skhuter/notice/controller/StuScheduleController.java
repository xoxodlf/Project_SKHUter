package com.classs.skhuter.notice.controller;

import java.util.Calendar;
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
	
	private Calendar cal = Calendar.getInstance();
	
	private String Month = (cal.get(Calendar.MONTH)<9?"0"+cal.get(Calendar.MONTH)+1:Integer.toString(cal.get(Calendar.MONTH)+1));
	
	/** 선택한 날짜에 따라서 리스트를 변경하기 위한 Date값 초기값은 현재 시간 */
	public String currentDate;
	public String thisMonth = cal.get(Calendar.YEAR)+"-"+(Integer.parseInt(Month)<10?"0"+Integer.parseInt(Month):Integer.parseInt(Month))+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
	public String nextMonth  = cal.get(Calendar.YEAR)+"-"+(Integer.parseInt(Month)+1)+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
	public String currentY = Integer.toString(cal.get(Calendar.YEAR));
	public String currentM = Integer.toString(cal.get(Calendar.MONTH)+1);
	
	/**
	 * 
	 * 스케쥴 목록 불러오기
	 */
	@RequestMapping("/stuSchedule")
	public String TimeLine(Model model) {
		logger.info("학사 일정 페이지");
		List<StuScheduleDTO> scheduleList =service.listAllSchedule();
		
		currentDate = cal.get(Calendar.YEAR)+"-"+Month+"-"+(cal.get(Calendar.DATE)<10?"0"+cal.get(Calendar.DATE):cal.get(Calendar.DATE))+" "+"00"+":"+"00"+":"+"00";
		
		System.out.println("오늘 날짜: "+currentDate);
		System.out.println("선택달 첫번째 날: "+thisMonth);
		System.out.println("선택달의 다음달 첫번째 날: "+nextMonth);
		
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("currentDate",currentDate);
		model.addAttribute("currentY",currentY);
		model.addAttribute("currentM",currentM);
		model.addAttribute("thisMonth",thisMonth);
		model.addAttribute("nextMonth",nextMonth);
		
		return "notice/stuSchedule.lay";
	}
	
	/**
	 * 
	 * 스케쥴 등록
	 */
	@RequestMapping(value="/stuSchedule/registSchedule", method = RequestMethod.POST)
	public String registSchedule(StuScheduleDTO registeredSchedule,RedirectAttributes rttr) {
		logger.info(registeredSchedule.toString());
		service.register(registeredSchedule);
		
		rttr.addFlashAttribute("message", "createsuccess");
		return "redirect:/notice/stuSchedule";	
	}
	
	/**
	 * 
	 * 스케쥴 삭제
	 */
	@RequestMapping(value="/stuSchedule/deleteSchedule", method = RequestMethod.POST)
	public String deleteSchedule(@RequestParam("schoolScheduleNo") int schoolScheduleNo,RedirectAttributes rttr) {
		logger.info(schoolScheduleNo+"");
		service.deleteSchedule(schoolScheduleNo);
		rttr.addFlashAttribute("message", "deletesuccess");
		return "redirect:/notice/stuSchedule";
	}
	
	@RequestMapping(value="/stuSchedule/changeDate",method = RequestMethod.POST)
	public String changeDate(String changeYear,String changeMonth,RedirectAttributes rttr,Model model) {
		currentY = changeYear;
		currentM = changeMonth;
		
		/**
		 * 일정이 끝나는 달을 고정시키기 위한 연산.
		 * 
		 * 
		 */
		thisMonth = changeYear+"-"+(Integer.parseInt(changeMonth)<10?"0"+Integer.parseInt(changeMonth):
			Integer.parseInt(changeMonth))+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
		
		/** 
		 * 일정이 끝나는 달까지만 표시해 주기 위한 연산.
		 * 
		 * 첫줄 Integer.parseInt(changeMonth)+1<10 는 사용자가 선택한 달이 10보다 낮으면
		 * changeYear+"-"+"0"+(Integer.parseInt(changeMonth)+1) 에서 "0" 부분을 추가하여 01~09 형식으로 바꿔준다.
		 * 두번째줄 Integer.parseInt(changeMonth)+1)>12 는 사용자가 선택한 달에 +1을 했을때 13이 넘어가면
		 * Integer.parseInt(changeYear)+1)+"-"+"01" 로 년수를 1 증가시키고 달을 1월달로 만들어준다.
		 * 세번째줄 changeYear+"-"+(Integer.parseInt(changeMonth)+1) 는 10~12달을 표시한다.
		 * 
		 *  */
		nextMonth  = (Integer.parseInt(changeMonth)+1<10 ? changeYear+"-"+"0"+(Integer.parseInt(changeMonth)+1):
			((Integer.parseInt(changeMonth)+1)>12 ? (Integer.parseInt(changeYear)+1)+"-"+"01":
				changeYear+"-"+(Integer.parseInt(changeMonth)+1)))+"-"+"01"+" "+"00"+":"+"00"+":"+"00";
		
		
		/** 계산한 값들을 jsp에 다시 적재한다 */
		model.addAttribute("thisMonth",thisMonth);
		model.addAttribute("nextMonth",nextMonth);
		rttr.addFlashAttribute("message","success");
		
		return "redirect:/notice/stuSchedule";
	}
}
