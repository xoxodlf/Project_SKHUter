package com.classs.skhuter.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value="/board/boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		return "board/boardList.lay";
	}
	
	@RequestMapping(value="/board/boardDetail", method=RequestMethod.GET)
	public String boardDetail(Model model) {
		return "board/boardDetail.lay";
	}
	
	@RequestMapping(value="/board/boardForm", method=RequestMethod.GET)
	public String boardForm(Model model) {
		return "board/boardForm.lay";
	}
}
