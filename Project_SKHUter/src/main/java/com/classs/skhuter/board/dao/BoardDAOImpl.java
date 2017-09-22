package com.classs.skhuter.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.classs.skhuter.board.domain.BoardDTO;

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
		return sqlSession.selectOne(namespace + ".get", boardNo);
	}

	@Override
	public void delete(int boardNo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BoardDTO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
