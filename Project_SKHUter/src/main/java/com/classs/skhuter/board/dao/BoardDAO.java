package com.classs.skhuter.board.dao;

import java.util.List;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.BoardLikeDTO;
import com.classs.skhuter.util.Criteria;

/**
 ** 게시판 관련 DB에서 데이터를 가져와 모델 생성
 **/

public interface BoardDAO {

	/** 게시물 등록 **/
	public void create(BoardDTO board);

	/** 게시물 불러오기 **/
	public BoardDTO read(int boardNo) throws Exception;

	/** 게시물 삭제 **/
	public void delete(int boardNo) throws Exception;

	/** 글 목록 모두 보이게 하기 **/
	public List<BoardDTO> listAll();

	/** 게시물 목록 페이징 처리 **/
	public List<BoardDTO> listPage(int page) throws Exception;

	/** 페이징 후 게시물 목록 출력 **/
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception;

	/** totalCount 변환 기능 **/
	public int countPaging(Criteria cri) throws Exception;

	/** 댓글 개수 세기 **/
	public int countReply(BoardDTO board) throws Exception;

	/** 조회수 처리 **/
	public void updateHitCount(int boardNo) throws Exception;

	// use for dynamic sql
	public List<BoardDTO> listSearch_t(Criteria cri) throws Exception;

	public int listSearchCount_t(Criteria cri) throws Exception;

	public List<BoardDTO> listSearch_c(Criteria cri) throws Exception;

	public int listSearchCount_c(Criteria cri) throws Exception;

	public List<BoardDTO> listSearch_tc(Criteria cri) throws Exception;

	public int listSearchCount_tc(Criteria cri) throws Exception;

	/** 좋아요 리스트 전체 불러오기 **/
	public List<BoardLikeDTO> LikeCountlistAll(int boardNo);
	
	/** 게시물의 좋아요 갯수 **/
	public int countLike(BoardDTO board);
	
	/** 좋아요 여부 **/
	public int isLike(int boardNo, int userNo);
	
	/** 좋아요 테이블 게시물 등록 **/
	public void createlike(int boardNo, int userNo);
	
	/** 좋아요 개수 업데이트**/
	public void uplikeCount(int boardNo);
	
	/** 싫어요 테이블 게시물 등록 **/
	public void createhate(int boardNo, int userNo);
	
	/** 싫어요 개수 업데이트**/
	public void uphateCount(int boardNo);
	
	/** 게시물의 싫어요 갯수 **/
	public int counthate(BoardDTO board);
	
	/** 싫어요 여부 **/
	public int ishate(int boardNo, int userNo);



}
