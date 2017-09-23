package com.classs.skhuter.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.board.domain.BoardDTO;

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


}
