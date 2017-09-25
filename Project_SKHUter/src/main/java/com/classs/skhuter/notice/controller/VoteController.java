package com.classs.skhuter.notice.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;
import com.classs.skhuter.notice.service.VoteService;

@Controller
@RequestMapping("/notice")
public class VoteController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Inject
	private VoteService service;
	
	@RequestMapping(value="/voteList", method=RequestMethod.GET)
	public String vote(Locale locale, Model model) {
		List<VoteDTO> vote = service.readVote();
		model.addAttribute("voteList", vote);
		logger.info("투표내역입장");
		
		
		return "notice/vote.lay";
	}
	
	@RequestMapping(value="/voteList/doVote", method = RequestMethod.POST)
	public String doVote(VoteListDTO doVote,RedirectAttributes rttr) {
		service.doVote(doVote);
		logger.info(doVote.toString());
		rttr.addFlashAttribute("message", "success");
		return "redirect:/notice/voteList";	
	}
	@RequestMapping(value="/voteList/registVote", method = RequestMethod.POST)
	public String registVote(VoteDTO registeredVote,RedirectAttributes rttr) {
		
		service.registVote(registeredVote);
		logger.info(registeredVote.toString());
		rttr.addFlashAttribute("message", "success");
		return "redirect:/notice/voteList";	
	}
	
	@RequestMapping(value="/voteForm", method=RequestMethod.GET)
	public String boardList(Model model) {
		return "notice/voteForm.lay";
	}
	
}
