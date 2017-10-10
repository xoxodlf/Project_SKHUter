package com.classs.skhuter.board.service;

import java.util.List;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.BoardLikeDTO;
import com.classs.skhuter.util.Criteria;

/**
 ** 게시판 관련 인터페이스 정의
 */

public interface BoardService {

	/**게시물 등록**/
	public void create(BoardDTO board);
	
	/**게시물 불러오기**/
	public BoardDTO read(int boardNo) throws Exception;

	/**게시물 삭제**/
	public void delete(int boardNo) throws Exception;

	/**글 목록 모두 보이게 하기**/
	public List<BoardDTO> listAll();
	
	/**페이징으로 글 목록 모두 보이게 하기**/
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception;
	
	/**댓글 개수 세기**/
	public int countReply(BoardDTO board) throws Exception;
	
	/** 조회수 처리 **/
	public int listCountCriteria(Criteria cri) throws Exception;
	
	
	 //use for dynamic sql
	  public List<BoardDTO> listSearch_t(Criteria cri)throws Exception;
	  public int listSearchCount_t(Criteria cri)throws Exception;
	  
	  public List<BoardDTO> listSearch_c(Criteria cri)throws Exception;
	  public int listSearchCount_c(Criteria cri)throws Exception;
	  
	  public List<BoardDTO> listSearch_tc(Criteria cri)throws Exception;
	  public int listSearchCount_tc(Criteria cri)throws Exception;
	  
	  /** 좋아요 불러오기**/
	  public List<BoardLikeDTO> LikeCountlistAll(int boardNo) throws Exception;
	  
	  /**좋아요 개수 세기**/
		public int countLike(BoardDTO board) throws Exception;
		
		/** 좋아요 했는지 여부 **/
		public int isLike(int boardNo, int userNo);
		
		/** 좋아요테이블에 게시물 등록 **/
		public void createlike(int boardNo, int userNo);
		
		/** 해당 게시물의 좋아요 1 올려주기 **/
		public void uplikeCount(int boardNo);
		
		/** 싫어요테이블에 게시물 등록 **/
		public void createhate(int boardNo, int userNo);
		
		/** 해당 게시물의 싫어요 1 올려주기 **/
		public void uphateCount(int boardNo);
		
		 /**싫어요 개수 세기**/
		public int counthate(BoardDTO board) throws Exception;
		
		/** 싫어요 했는지 여부 **/
		public int ishate(int boardNo, int userNo);
	
}
