package com.classs.skhuter.board.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;

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
		return dao.read(boardNo);
	}

	@Override
	public void delete(int boardNo) throws Exception {
		dao.delete(boardNo);
	}

	@Override
	public List<BoardDTO> listAll() throws Exception {
		return dao.listAll();
	}

}
