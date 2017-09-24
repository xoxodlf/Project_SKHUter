package com.classs.skhuter.board.service;

import java.util.List;

import com.classs.skhuter.board.domain.BoardDTO;

public interface BoardService {

	/**게시물 등록**/
	public void create(BoardDTO board);
	
	/**게시물 불러오기**/
	public BoardDTO read(int boardNo) throws Exception;

	/**게시물 삭제**/
	public void delete(int boardNo) throws Exception;

	/**글 목록 모두 보이게 하기**/
	public List<BoardDTO> listAll() throws Exception;
}
