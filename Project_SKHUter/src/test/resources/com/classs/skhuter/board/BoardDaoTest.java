package com.classs.skhuter.board;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoTest {
	
	@Inject
	private BoardDAO dao;
	
	Logger logger = Logger.getLogger(BoardDaoTest.class);

	@Test
	public void TestRegister() {
		BoardDTO board = new BoardDTO();
		board.setTitle("제목이다데스");
		board.setPassword("123");
		board.setContent("내용이다데스");
		
		dao.create(board);
		
		logger.info("신규게시 완료~~~~");
		logger.info(board.toString());
	}
}
