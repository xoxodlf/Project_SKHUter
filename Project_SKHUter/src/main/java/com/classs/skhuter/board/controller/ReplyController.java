package com.classs.skhuter.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;
import com.classs.skhuter.board.service.BoardService;
import com.classs.skhuter.board.service.ReplyService;

/**
 ** 익명게시판 댓글 관련 프로젝트 Controller @RequestMapping("/replies") URI 매칭
 **/

@RestController
@RequestMapping("/replies")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Inject
	private ReplyService service;

	/** 댓글 등록 POST방식 **/
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> registerReply(@RequestBody ReplyDTO reply) {
		ResponseEntity<String> entity = null;
		try {
			service.createReply(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/** 특정 게시물의 전체 댓글 리스트 구현 **/
	@RequestMapping(value = "/all/{boardNo}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> listAllReply(@PathVariable("boardNo") int boardNo) {
		ResponseEntity<List<ReplyDTO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.listAllReply(boardNo), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/** 댓글 삭제하기 **/
	@RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> removeReply(@PathVariable("replyNo") int replyNo) {

		ResponseEntity<String> entity = null;
		try {
			service.deleteReply(replyNo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}