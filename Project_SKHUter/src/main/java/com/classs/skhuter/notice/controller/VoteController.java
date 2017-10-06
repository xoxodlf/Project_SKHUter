package com.classs.skhuter.notice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;
import com.classs.skhuter.notice.service.VoteService;
import com.classs.skhuter.user.domain.UserDTO;

@Controller
@RequestMapping("/notice")
public class VoteController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Inject
	private VoteService service;
	
	@RequestMapping(value="/voteList", method=RequestMethod.GET)
	public String vote(Locale locale, Model model, HttpServletRequest req) {
		List<VoteDTO> doingvote = service.readDoingVote();
		List<VoteDTO> donevote = service.readDoneVote();
		VoteListDTO tmp= new VoteListDTO();
		 UserDTO user = (UserDTO)req.getSession().getAttribute("login");
		 
		for(VoteDTO vote : doingvote) {
			
			tmp.setUserNo(user.getUserNo());
			tmp.setVoteNo(vote.getVoteNo());
			logger.info(tmp.toString());
			int isVote = service.getIsVoteNo(tmp);
			vote.setIsVote(isVote);
			logger.info(""+isVote);
		}
		model.addAttribute("doingVoteList", doingvote);
		model.addAttribute("doneVoteList", donevote);
		
		logger.info("투표내역입장");
		
		
		return "notice/vote.lay";
	}
	
	 @RequestMapping(value = "/vote/delete", method = RequestMethod.POST)
	  public String remove(@RequestParam("voteNo") int voteNo, RedirectAttributes rttr) throws Exception {
		
	    service.deleteVote(voteNo);

	   
	    
	    rttr.addFlashAttribute("message", "deletesuccess");
	   

	    return "redirect:/notice/voteList";
	  }
	
	 
	 
	@RequestMapping(value="/voteList/upVote", method = RequestMethod.POST)
	public String doVote(VoteDTO upVote,RedirectAttributes rttr) {
		
		logger.info(upVote.toString());
		service.upVote(upVote);
		VoteListDTO doVote = new VoteListDTO();
		doVote.setVoteNo(upVote.getVoteNo());
		doVote.setUserNo(upVote.getUserNo());
		doVote.setSelectItem("투표했다이사람");
		service.doVote(doVote);
		logger.info(doVote.toString());
		rttr.addFlashAttribute("message", "success");
		return "redirect:/notice/voteList";	
	}
	@RequestMapping(value="/voteList/registVote", method = RequestMethod.POST)
	public String registVote(VoteDTO registeredVote,RedirectAttributes rttr) {
		logger.info(registeredVote.toString());
		service.registVote(registeredVote);
		
		rttr.addFlashAttribute("message", "createsuccess");
		return "redirect:/notice/voteList";	
	}
	
	@RequestMapping(value="/voteForm", method=RequestMethod.GET)
	public String boardList(Model model) {
		return "notice/voteForm.lay";
	}
	
}
