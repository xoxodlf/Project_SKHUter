package com.classs.skhuter.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.util.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.classs.skhuter.mappers.BoardMapper";

	Logger logger = Logger.getLogger(BoardDAOImpl.class);

	@Override
	public void create(BoardDTO board) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".create", board);
	}

	@Override
	public BoardDTO read(int boardNo) throws Exception {
		// TODO Auto-generated method stub
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
	  
	  /**게시물 목록 페이징 처리**/
	  @Override
	  public List<BoardDTO> listPage(int page) throws Exception {

	    if (page <= 0) {
	      page = 1;
	    }
	    page = page * 10;

	    return sqlSession.selectList(namespace + ".listPage", page);
	  }
	  
	  @Override
	  public List<BoardDTO> listCriteria(Criteria cri) throws Exception {

	    return sqlSession.selectList(namespace + ".listCriteria", cri);
	  }
	  
	  @Override
		public int countReply(BoardDTO board) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace + ".countReply", board);
		}

	@Override
	public void updateHitCount(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateHitCount", boardNo);
		
	}

} 
