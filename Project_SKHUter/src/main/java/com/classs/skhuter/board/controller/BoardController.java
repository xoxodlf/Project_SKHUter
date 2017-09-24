package com.classs.skhuter.board.controller;

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

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.service.BoardService;
import com.classs.skhuter.notice.domain.VoteDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	/*게시물 등록 페이지*/
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public String boardForm(Model model) {
		return "board/boardForm.lay";
	}
	
	/*게시물 등록*/
	@RequestMapping(value = "/boardForm", method = RequestMethod.POST)
	public String registPOST(BoardDTO board, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());

		service.create(board);

		rttr.addAttribute("result", "success");

		return "redirect:/board/boardList.lay";
	}
	 
	/*게시판 목록 불러오기*/
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public String boardList(Locale locale, Model model) throws Exception {
		List<BoardDTO> board = service.listAll();
		model.addAttribute("listAll", board);
		return "board/boardList.lay";
	}
	
	/*게시물 불러오기*/
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(Model model) {
		return "board/boardDetail.lay";
	}
	
	
	
	
}