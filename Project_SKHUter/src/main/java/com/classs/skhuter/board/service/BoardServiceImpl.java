package com.classs.skhuter.board.service;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.classs.skhuter.board.controller.BoardController;
import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.BoardLikeDTO;
import com.classs.skhuter.util.Criteria;

/**
 ** BoardService 인터페이스 구현 클래스
 */

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	/** 게시물 등록 **/
	@Override
	public void create(BoardDTO board) {
		dao.create(board);
	}

	/** 게시물 불러오기 **/
	@Override
	public BoardDTO read(int boardNo) throws Exception {
		dao.updateHitCount(boardNo);
		return dao.read(boardNo);
	}

	/** 게시물 삭제 **/
	@Override
	public void delete(int boardNo) throws Exception {
		dao.delete(boardNo);
	}

	/** 글 목록 모두 보이게 하기 **/
	@Override
	public List<BoardDTO> listAll() {
		return dao.listAll();
	}

	/** 페이징으로 글 목록 모두 보이게 하기 **/
	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	/** 댓글 개수 세기 **/
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

	// use for dynamic sql
	@Override
	public List<BoardDTO> listSearch_t(Criteria cri) throws Exception {

		return dao.listSearch_t(cri);
	}

	@Override
	public int listSearchCount_t(Criteria cri) throws Exception {

		return dao.listSearchCount_t(cri);
	}

	@Override
	public List<BoardDTO> listSearch_c(Criteria cri) throws Exception {

		return dao.listSearch_c(cri);
	}

	@Override
	public int listSearchCount_c(Criteria cri) throws Exception {

		return dao.listSearchCount_c(cri);
	}

	@Override
	public List<BoardDTO> listSearch_tc(Criteria cri) throws Exception {

		return dao.listSearch_tc(cri);
	}

	@Override
	public int listSearchCount_tc(Criteria cri) throws Exception {

		return dao.listSearchCount_tc(cri);
	}

	@Override
	public List<BoardLikeDTO> LikeCountlistAll(int boardNo) {
		// TODO Auto-generated method stub
		return dao.LikeCountlistAll(boardNo);
	}

	/** 좋아요 개수 세기 **/
	@Override
	public int countLike(BoardDTO board) throws Exception {
		// TODO Auto-generated method stub
		return dao.countLike(board);
	}

	/** 좋아요 했는지 여부 **/
	@Override
	public int isLike(int boardNo, int userNo) {
		return dao.isLike(boardNo, userNo);
	}

	/** 좋아요테이블에 게시물 등록 **/
	@Override
	public void createlike(int boardNo, int userNo) {
		// TODO Auto-generated method stub
		dao.createlike(boardNo, userNo);
	}

	/** 해당 게시물의 좋아요 1 올려주기 **/
	@Override
	public void uplikeCount(int boardNo) {	// TODO Auto-generated method stub
		dao.uplikeCount(boardNo);
		
	};
	
	/** 싫어요테이블에 게시물 등록 **/
	@Override
	public void createhate(int boardNo, int userNo) {
		// TODO Auto-generated method stub
		dao.createhate(boardNo, userNo);
	}

	/** 해당 게시물의 싫어요 1 올려주기 **/
	@Override
	public void uphateCount(int boardNo) {	// TODO Auto-generated method stub
		dao.uphateCount(boardNo);
		
	};
	
	/**싫어요 개수 세기**/
	@Override
	public int counthate(BoardDTO board) throws Exception{
		// TODO Auto-generated method stub
		return dao.counthate(board);
	}

	/** 싫어요 했는지 여부 **/
	@Override
	public int ishate(int boardNo, int userNo) {
		return dao.ishate(boardNo, userNo);
	}
	

}
