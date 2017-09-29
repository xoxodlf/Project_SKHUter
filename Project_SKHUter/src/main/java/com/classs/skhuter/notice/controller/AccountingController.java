package com.classs.skhuter.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.notice.service.AccountingService;

@Controller
public class AccountingController {
	private static final Logger logger = LoggerFactory.getLogger(AccountingController.class);
	
	@Inject
	private AccountingService accountingService;
	
	@RequestMapping(value="/notice/accountingList", method=RequestMethod.GET)
	public String accountingList(Model model) {
		logger.info("여기는 회계내역 페이지!!!");
		
		List<AccountingDTO> accountingList = accountingService.listAll();
		
		model.addAttribute("list",accountingList);
		
		return "notice/accountingList.lay";
	}
	
	@RequestMapping(value="/notice/accountingForm", method=RequestMethod.GET)
	public String accountingForm(Model model) {
		return "notice/accountingForm.lay";
	}
}
