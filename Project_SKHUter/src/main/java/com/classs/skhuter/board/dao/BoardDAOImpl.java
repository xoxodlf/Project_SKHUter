package com.classs.skhuter.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.BoardLikeDTO;
import com.classs.skhuter.util.Criteria;

/**
 ** BoardDAO 인터페이스를 구현하는 클래스
 **/

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.classs.skhuter.mappers.BoardMapper";

	Logger logger = Logger.getLogger(BoardDAOImpl.class);

	/** 게시물 등록 **/
	@Override
	public void create(BoardDTO board) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".create", board);
	}

	/** 게시물 불러오기 **/
	@Override
	public BoardDTO read(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".read", boardNo);
	}

	/** 게시물 삭제 **/
	@Override
	public void delete(int boardNo) throws Exception {
		sqlSession.delete(namespace + ".delete", boardNo);
	}

	/** 글 목록 모두 보이게 하기 **/
	@Override
	public List<BoardDTO> listAll() {
		return sqlSession.selectList(namespace + ".listAll");
	}

	/** 게시물 목록 페이징 처리 **/
	@Override
	public List<BoardDTO> listPage(int page) throws Exception {

		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;

		return sqlSession.selectList(namespace + ".listPage", page);
	}

	/** 페이징 후 게시물 목록 출력 **/
	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	/** 게시글 전체 개수 Count 출력 **/
	@Override
	public int countReply(BoardDTO board) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".countReply", board);
	}

	/** 댓글 개수 세기 **/
	@Override
	public void updateHitCount(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateHitCount", boardNo);
	}

	/** 조회수 처리 **/
	@Override
	public int countPaging(Criteria cri) throws Exception {

		return sqlSession.selectOne(namespace + ".countPaging", cri);
	}

	// use for dynamic sql
	@Override
	public List<BoardDTO> listSearch_t(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace + ".listSearch_t", cri);
	}

	@Override
	public int listSearchCount_t(Criteria cri) throws Exception {

		return sqlSession.selectOne(namespace + ".listSearchCount_t", cri);
	}

	@Override
	public List<BoardDTO> listSearch_c(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace + ".listSearch_c", cri);
	}

	@Override
	public int listSearchCount_c(Criteria cri) throws Exception {

		return sqlSession.selectOne(namespace + ".listSearchCount_c", cri);
	}

	@Override
	public List<BoardDTO> listSearch_tc(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace + ".listSearch_tc", cri);
	}

	@Override
	public int listSearchCount_tc(Criteria cri) throws Exception {

		return sqlSession.selectOne(namespace + ".listSearchCount_tc", cri);
	}

	/** 좋아요리스트 불러오기 **/
	@Override
	public List<BoardLikeDTO> LikeCountlistAll(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".LikeCountlistAll", boardNo);
	}
	
	/** 해당 보드의 좋아요 개수**/
	@Override
	public int countLike(BoardDTO board){
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".countLike", board);
	}
	/** 좋아요 했는지 여부 **/
	public int isLike(int boardNo, int userNo) {
		// TODO Auto-generated method stub
				Map<String, Object> paramMap = new HashMap<String, Object>();
				
				paramMap.put("boardNo", boardNo);
				paramMap.put("userNo", userNo);
					
		return sqlSession.selectOne(namespace + ".isLike", paramMap);
	}

	/** 좋아요 등록 **/
	@Override
	public void createlike(int boardNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
		
		sqlSession.insert(namespace + ".createlike", paramMap);
	}
	
	/** 싫어요 개수 업데이트**/
	@Override
	public void uplikeCount(int boardNo) {	// TODO Auto-generated method stub
		sqlSession.update(namespace + ".uplikeCount", boardNo);
		
	};
	
	/** 싫어요 테이블 게시물 등록 **/
	@Override
	public void createhate(int boardNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
		
		sqlSession.insert(namespace + ".createhate", paramMap);
	}
	
	/** 싫어요 개수 업데이트**/
	@Override
	public void uphateCount(int boardNo) {	// TODO Auto-generated method stub
		sqlSession.update(namespace + ".uphateCount", boardNo);
		
	};
	
	/** 해당 보드의 싫어요 개수**/
	@Override
	public int counthate(BoardDTO board){
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".counthate", board);
	}
	/** 싫어요 했는지 여부 **/
	public int ishate(int boardNo, int userNo) {
		// TODO Auto-generated method stub
				Map<String, Object> paramMap = new HashMap<String, Object>();
				
				paramMap.put("boardNo", boardNo);
				paramMap.put("userNo", userNo);
					
		return sqlSession.selectOne(namespace + ".ishate", paramMap);
	}
	
	
}
