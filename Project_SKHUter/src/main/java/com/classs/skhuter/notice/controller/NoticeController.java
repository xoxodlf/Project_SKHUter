package com.classs.skhuter.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.classs.skhuter.notice.domain.NoticeDTO;
import com.classs.skhuter.notice.service.NoticeService;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.PageMaker;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList(@ModelAttribute("cri") Criteria cri,Model model) throws Exception {
		List<NoticeDTO> list;
		if(cri.getSearchType()!=null) {
			if(cri.getSearchType().equals("t")) {
				list = service.listSearch_t(cri);
			}
			else if(cri.getSearchType().equals("c")) list = service.listSearch_c(cri);
			else if(cri.getSearchType().equals("tc"))list = service.listSearch_tc(cri);
			else {
				list = service.listCriteria(cri);
			}
			}else list = service.listCriteria(cri);
		
		model.addAttribute(list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if(cri.getSearchType()=="t") pageMaker.setTotalCount(service.listSearchCount_t(cri));
		else if(cri.getSearchType()=="c") pageMaker.setTotalCount(service.listSearchCount_c(cri));
		else if(cri.getSearchType()=="tc")pageMaker.setTotalCount(service.listSearchCount_tc(cri));
		else pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("pageMaker", pageMaker);
		return "notice/noticeList.lay";
	}
	
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public String noticeDetail(@RequestParam("boardNo") int boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
		return "notice/noticeDetail.lay";
	}
	
	@RequestMapping(value="/noticeForm", method=RequestMethod.GET)
	public String noticeForm(Model model) {
		return "notice/noticeForm.lay";
	}
}
