package com.classs.skhuter.board;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.board.dao.ReplyDAO;
import com.classs.skhuter.board.domain.ReplyDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ReplyDaoTest {

	@Inject
	private ReplyDAO dao;

	Logger logger = Logger.getLogger(ReplyDaoTest.class);

	@Test
	public void TestCreate() throws Exception {
		ReplyDTO reply = new ReplyDTO();
		reply.setBoardNo(2);
		reply.setUserNo(1);
		reply.setContent("댓글이다아아");
		
		dao.createReply(reply);
		
		logger.info("댓글 생성 테스트 완료~~~~");
		logger.info(reply.toString());
	}
}