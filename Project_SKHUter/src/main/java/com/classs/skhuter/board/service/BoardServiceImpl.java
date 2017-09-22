package com.classs.skhuter.board.service;

import javax.inject.Inject;

import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;

public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public void create(BoardDTO board) {
		dao.create(board);
	}

}
