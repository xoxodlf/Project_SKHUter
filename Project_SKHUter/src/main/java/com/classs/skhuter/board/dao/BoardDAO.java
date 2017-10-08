package com.classs.skhuter.board.dao;

import java.sql.Date;
import java.util.List;
import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;
import com.classs.skhuter.util.Criteria;

/**
 * 게시판 관련 DB에서 데이터를 가져와 모델 생성
 * 
 * @패키지 : com.classs.skhuter.user.domain
 * @파일명 : BoardDAO.java
 * @작성자 : 이겨레
 * @작성일 : 2017. 9. 23.
 *
 */
public interface BoardDAO {

	/**게시물 등록**/
	public void create(BoardDTO board);
	
	/**게시물 불러오기**/
	public BoardDTO read(int boardNo) throws Exception;

	/**게시물 삭제**/
	public void delete(int boardNo) throws Exception;

	/**글 목록 모두 보이게 하기**/
	public List<BoardDTO> listAll();

	/**게시물 목록 페이징 처리**/
	public List<BoardDTO> listPage(int page) throws Exception;
	
	/**페이징 후 게시물 목록 출력**/
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception;
	
	/**totalCount 변환 기능**/
	public int countPaging(Criteria cri) throws Exception;
	
	/**댓글 개수 세기**/
	public int countReply(BoardDTO board) throws Exception;
	
	/**조회수 처리**/
	public void updateHitCount(int boardNo) throws Exception;

}
