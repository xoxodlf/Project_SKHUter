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
 * BoardDAO 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.classs.skhuter.board.dao
 * @파일명 : BoardDAOImpl.java
 * @작성자 : 이겨레
 * @작성일 : 2017. 09. 19. 
 *
 */

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.classs.skhuter.mappers.BoardMapper";

	Logger logger = Logger.getLogger(BoardDAOImpl.class);

	@Override
	public void create(BoardDTO board) {
		sqlSession.insert(namespace + ".create", board);
	}

	@Override
	public BoardDTO read(int boardNo) throws Exception {
		return sqlSession.selectOne(namespace + ".read", boardNo);
	}

	@Override
	public void delete(int boardNo) throws Exception {
		sqlSession.delete(namespace + ".delete", boardNo);
	}

	@Override
	public List<BoardDTO> listAll() {
		return sqlSession.selectList(namespace + ".listAll");
	}

	@Override
	public List<BoardDTO> listPage(int page) throws Exception {

		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;

		return sqlSession.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countReply(BoardDTO board) throws Exception {
		
		return sqlSession.selectOne(namespace + ".countReply", board);
	}

	@Override
	public void updateHitCount(int boardNo) throws Exception {
		
		sqlSession.update(namespace + ".updateHitCount", boardNo);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

		return sqlSession.selectOne(namespace + ".countPaging", cri);
	}

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

	@Override
	public List<BoardLikeDTO> LikeCountlistAll(int boardNo) {
		return sqlSession.selectList(namespace + ".LikeCountlistAll", boardNo);
	}
	
	@Override
	public int countLike(BoardDTO board){
		return sqlSession.selectOne(namespace + ".countLike", board);
	}
	
	public int isLike(int boardNo, int userNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
					
		return sqlSession.selectOne(namespace + ".isLike", paramMap);
	}

	@Override
	public void createlike(int boardNo, int userNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
		
		sqlSession.insert(namespace + ".createlike", paramMap);
	}
	
	@Override
	public void uplikeCount(int boardNo) {	
		sqlSession.update(namespace + ".uplikeCount", boardNo);
	}
	
	@Override
	public void createhate(int boardNo, int userNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
		
		sqlSession.insert(namespace + ".createhate", paramMap);
	}
	
	@Override
	public void uphateCount(int boardNo) {	
		sqlSession.update(namespace + ".uphateCount", boardNo);
	}
	
	@Override
	public int counthate(BoardDTO board){
		return sqlSession.selectOne(namespace + ".counthate", board);
	}
	public int ishate(int boardNo, int userNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("userNo", userNo);
					
		return sqlSession.selectOne(namespace + ".ishate", paramMap);
	}
}
