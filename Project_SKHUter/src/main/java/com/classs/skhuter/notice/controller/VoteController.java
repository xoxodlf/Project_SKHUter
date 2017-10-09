package com.classs.skhuter.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/**
	 * 투표 목록 불러오기
	 *
	 * @Method Name : vote
	 * @param locale
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/voteList", method=RequestMethod.GET)
	public String vote(Locale locale, Model model, HttpServletRequest req) {
		List<VoteDTO> doingvote = service.readDoingVote();
		List<VoteDTO> donevote = service.readDoneVote();
		
		VoteListDTO tmp= new VoteListDTO();
		
		UserDTO user = (UserDTO)req.getSession().getAttribute("login");
		 
		for(VoteDTO vote : doingvote) {
			
			tmp.setUserNo(user.getUserNo());
			tmp.setVoteNo(vote.getVoteNo());
			
			int joinCount = service.getJoinCount(tmp);
			int isVote = service.getIsVoteNo(tmp);
			
			vote.setIsVote(isVote);
			vote.setJoinCount(joinCount);
		}
		
		model.addAttribute("doingVoteList", doingvote);
		model.addAttribute("doneVoteList", donevote);
		
		logger.info("투표 내역 입장");
		
		
		return "notice/vote.lay";
	}
	
	/**
	 * 투표 삭제
	 *
	 * @Method Name : remove
	 * @param voteNo
	 * @param rttr
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping(value = "/vote/delete", method = RequestMethod.POST)
	  public String remove(@RequestParam("voteNo") int voteNo, RedirectAttributes rttr) throws Exception {
		
	    service.deleteVote(voteNo);
	    
	    rttr.addFlashAttribute("message", "deletesuccess");
	   
	    return "redirect:/notice/voteList";
	  }
	
	 
	 /**
	  * 투표했을 때 투표 수 올리기
	  * 
	  * @Method Name : doVote
	  * @param upVote
	  * @param rttr
	  * @return
	  */
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
	
	/**
	 * 투표 등록
	 *
	 * @Method Name : registVote
	 * @param registeredVote
	 * @param rttr
	 * @return
	 */

	@RequestMapping(value="/voteList/registVote", method = RequestMethod.POST)
	public String registVote(VoteDTO registeredVote,RedirectAttributes rttr) {
		logger.info(registeredVote.toString());
		service.registVote(registeredVote);
		
		rttr.addFlashAttribute("message", "createsuccess");
		return "redirect:/notice/voteList";	
	}
	
	/**
	 * 투표 투표 등록 창 불러오기
	 *
	 * @Method Name : boardList
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/voteForm", method=RequestMethod.GET)
	public String boardList(Model model) {
		return "notice/voteForm.lay";
	}
	
	
	
	/** 모바일 전용 컨트롤러 */
	
	   
	/**
	 * 모바일용 투표 목록 조회
	 *
	 * @Method Name : getvoteListMobile
	 * @return
	 */
	@RequestMapping(value = "/voteListMobile", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getvoteListMobile (UserDTO user) {
		Map<String, Object> voteMap = new HashMap<String, Object>();
		
		List<VoteDTO> doingvote = service.readDoingVote();
		List<VoteDTO> donevote = service.readDoneVote();
		
		System.out.println("VOTE MOBILE - userNo = "+user.getUserNo()+" / name = "+user.getName()+" / id = "+user.getId());
		VoteListDTO tmp= new VoteListDTO();
		 
		for(VoteDTO vote : doingvote) {
			
			tmp.setUserNo(user.getUserNo());
			tmp.setVoteNo(vote.getVoteNo());
			
			
			int joinCount = service.getJoinCount(tmp);
			int isVote = service.getIsVoteNo(tmp);
			
			vote.setIsVote(isVote);
			vote.setJoinCount(joinCount);
		}
		
		voteMap.put("doingVoteList", doingvote);
		voteMap.put("doneVoteList", donevote);
		
		return voteMap;
	}
	
	/**
	 * 모바일용 투표 참여
	 *
	 * @Method Name : doVoteMobile
	 * @param upVote
	 * @return
	 */
	@RequestMapping(value = "/doVoteMobile", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> doVoteMobile (VoteDTO upVote) {
		Map<String, Object> voteMap = new HashMap<String, Object>();
		
		service.upVote(upVote);
		
		VoteListDTO doVote = new VoteListDTO();
		
		doVote.setVoteNo(upVote.getVoteNo());
		doVote.setUserNo(upVote.getUserNo());
		doVote.setSelectItem("투표했다 이 사람");
		
		service.doVote(doVote);
		
		voteMap.put("message", "success");
		
		return voteMap;
	}
}
