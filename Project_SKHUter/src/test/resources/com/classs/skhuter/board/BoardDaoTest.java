package com.classs.skhuter.board;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.board.domain.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDaoTest {

	@Inject
	private BoardDAO dao;

	Logger logger = Logger.getLogger(BoardDaoTest.class);

	@Test
	public void TestCreate() {
		BoardDTO board = new BoardDTO();
		board.setUserNo(1);
		board.setTitle("테스트12");
		board.setHitCount(10);
		board.setPassword("123");
		board.setContent("테스트5의 내용이다");
		board.setLikeCount(1);
		board.setHateCount(2);

		dao.create(board);

		logger.info("신규게시 완료~~~~");
		logger.info(board.toString());
	}

	@Test
	public void testRead() throws Exception {

		logger.info(dao.read(1).toString());
	}

	@Test
	public void testDelete() throws Exception {
		dao.delete(29);
	}
	
	  @Test
	  public void testListPage() throws Exception {

	    int page = 3;

	    List<BoardDTO> list = dao.listPage(page);

	    for (BoardDTO dao : list) {
	      logger.info(dao.getBoardNo() + ":" + dao.getTitle());
	    }
	  }
}
