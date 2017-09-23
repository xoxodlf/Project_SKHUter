package com.classs.skhuter.council.controller;

import java.text.DateFormat;
import java.util.ArrayList;
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

import com.classs.skhuter.council.domain.MeetingNoteDTO;
import com.classs.skhuter.council.service.MeetingNoteService;
import com.classs.skhuter.notice.controller.VoteController;
import com.classs.skhuter.user.domain.UserDTO;
import com.classs.skhuter.user.service.UserService;

@Controller
public class MeetingNoteController {
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Inject
	private MeetingNoteService noteService;
	
	@Inject
	private UserService userService;
	
	@RequestMapping("/council/meetingNote")
	public String meetingNote(Model model) {
		logger.info("여기는 학생회 회의록!!!");
		
		List<MeetingNoteDTO> NoteList = noteService.listAll();
		List<UserDTO> name = new ArrayList<UserDTO>();
		
		for (MeetingNoteDTO meetingNote : NoteList) {
			name.add(userService.get(meetingNote.getUserNo()));
		}
		
		model.addAttribute("list", NoteList);
		model.addAttribute("name", name);
		
		return "council/meetingNote.lay";
	}
	
	@RequestMapping(value="council/MeetingNote/register",method = RequestMethod.POST)
	public String register(MeetingNoteDTO meetingNote,Model model) {
		
		noteService.register(meetingNote);
//		model.addAttribute(arg0);
		
		
		return "/council/MeetingNote";
	}
}
