package com.classs.skhuter.board.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.service.BoardService;
import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.util.Criteria;
import com.classs.skhuter.util.PageMaker;

/**
 ** 익명게시판 관련 프로젝트 Controller @RequestMapping("/board") URI 매칭
 **/

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	/** 게시글 등록 GET방식 **/
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public String boardForm(Model model) {

		return "board/boardForm.lay";
	}

	/** 게시글 등록 POST방식 **/
	@RequestMapping(value = "/boardForm", method = RequestMethod.POST)
	public String registPOST(BoardDTO board, RedirectAttributes rttr) throws Exception {

		service.create(board);
		rttr.addFlashAttribute("message", "createsuccess");
		logger.info(board.toString());

		return "redirect:/board/boardList";
	}

	/** 게시글 불러오기 **/
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String read(@RequestParam("boardNo") int boardNo, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		model.addAttribute(cri);
		model.addAttribute(service.read(boardNo));
		return "board/boardDetail.lay";
	}

	/** 게시글 삭제하기 **/
	@RequestMapping(value = "boardDetail/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("boardNo") int boardNo, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("컨트롤러랍니다~");
		service.delete(boardNo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("message", "deletesuccess");

		return "redirect:/board/boardList";
	}

	/**
	 * 게시판 리스트 구현 페이징 기능 검색 기능
	 **/
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.info(cri.toString());
		List<BoardDTO> list = service.listCriteria(cri);

		BoardDTO tmp = new BoardDTO();

		for (BoardDTO board : list) {
			tmp.setBoardNo(board.getBoardNo());
			int replyCount = service.countReply(tmp);
			board.setReplyCount(replyCount);
			logger.info(board.toString());
		}

		model.addAttribute("boardList", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(151);

		pageMaker.setTotalCount(service.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);

		return "board/boardList.lay";

	}

}