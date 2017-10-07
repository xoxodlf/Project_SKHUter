package com.classs.skhuter.board.service;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.classs.skhuter.board.controller.BoardController;
import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.util.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public void create(BoardDTO board) {
		dao.create(board);
	}

	@Override
	public BoardDTO read(int boardNo) throws Exception {
		dao.updateHitCount(boardNo);
		return dao.read(boardNo);
	}

	@Override
	public void delete(int boardNo) throws Exception {
		dao.delete(boardNo);
	}
	
	@Override
	public List<BoardDTO> listAll() {
		return dao.listAll();
	}

	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}
	
	@Override
	public int countReply(BoardDTO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.countReply(board);
	}


	
}
