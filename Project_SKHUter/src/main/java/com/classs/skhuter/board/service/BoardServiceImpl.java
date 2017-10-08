package com.classs.skhuter.board.service;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.classs.skhuter.board.controller.BoardController;
import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.util.Criteria;

/**
 ** BoardService 인터페이스 구현 클래스
 */

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	/**게시물 등록**/
	@Override
	public void create(BoardDTO board) {
		dao.create(board);
	}

	/**게시물 불러오기**/
	@Override
	public BoardDTO read(int boardNo) throws Exception {
		dao.updateHitCount(boardNo);
		return dao.read(boardNo);
	}

	/**게시물 삭제**/
	@Override
	public void delete(int boardNo) throws Exception {
		dao.delete(boardNo);
	}
	
	/**글 목록 모두 보이게 하기**/
	@Override
	public List<BoardDTO> listAll() {
		return dao.listAll();
	}

	/**페이징으로 글 목록 모두 보이게 하기**/
	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}
	
	/**댓글 개수 세기**/
	@Override
	public int countReply(BoardDTO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.countReply(board);
	}
	
	
	/** 조회수 처리 **/
	@Override
	  public int listCountCriteria(Criteria cri) throws Exception {

	    return dao.countPaging(cri);
	  }

	
}
