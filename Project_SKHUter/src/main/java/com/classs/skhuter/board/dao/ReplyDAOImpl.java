package com.classs.skhuter.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.classs.skhuter.mappers.ReplyMapper";

	Logger logger = Logger.getLogger(ReplyDAOImpl.class);

	@Override
	public void createReply(ReplyDTO reply) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".createReply", reply);
	}
	
	@Override
	  public void deleteReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteReply", replyNo);
	  }
	 @Override
	  public List<ReplyDTO> listAllReply(int boardNo) throws Exception {

	    return sqlSession.selectList(namespace + ".listAllReply", boardNo);
	  }
	 
}
