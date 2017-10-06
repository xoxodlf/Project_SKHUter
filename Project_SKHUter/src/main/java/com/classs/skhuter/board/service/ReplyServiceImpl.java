package com.classs.skhuter.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.dao.ReplyDAO;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public void createReply(ReplyDTO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.createReply(reply);
	}

	@Override
	public void deleteReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(replyNo);
	}

	@Override
	public List<ReplyDTO> listAllReply(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAllReply(boardNo);
	}
}
