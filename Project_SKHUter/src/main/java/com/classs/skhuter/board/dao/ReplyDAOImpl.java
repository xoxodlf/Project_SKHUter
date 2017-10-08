package com.classs.skhuter.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;

/**
 ** ReplyDAO 인터페이스를 구현하는 클래스
 **/

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.classs.skhuter.mappers.ReplyMapper";

	Logger logger = Logger.getLogger(ReplyDAOImpl.class);

	/** 댓글 리스트 보여주기 **/
	@Override
	public void createReply(ReplyDTO reply) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".createReply", reply);
	}

	/** 댓글 등록 **/
	@Override
	public void deleteReply(int replyNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteReply", replyNo);
	}

	/** 댓글 삭제 **/
	@Override
	public List<ReplyDTO> listAllReply(int boardNo) throws Exception {

		return sqlSession.selectList(namespace + ".listAllReply", boardNo);
	}

}
