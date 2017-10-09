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
import com.classs.skhuter.board.domain.BoardLikeDTO;
import com.classs.skhuter.util.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardDaoTest {

	@Inject
	private BoardDAO dao;

	Logger logger = Logger.getLogger(BoardDaoTest.class);
	@Test
	public void TestCreate() {
		//for(int i=201; i<=230; i++) {
		BoardDTO board = new BoardDTO();
		board.setUserNo(1);
		board.setTitle("테스트231");
		board.setHitCount(10);
		board.setPassword("123");
		board.setContent("9");
		board.setLikeCount(1);
		board.setHateCount(2);

		dao.create(board);

		logger.info("신규게시 완료~~~~");
		logger.info(board.toString());
		//}
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

	    int page = 4;

	    List<BoardDTO> list = dao.listPage(page);

	    for (BoardDTO dao : list) {
	      logger.info(dao.getBoardNo() + ":" + dao.getTitle());
	    }
	  }
	  
	  @Test
	  public void testListCriteria() throws Exception {

	    Criteria cri = new Criteria();
	    cri.setPage(2);
	    cri.setPerPageNum(10);

	    List<BoardDTO> list = dao.listCriteria(cri);

	    for (BoardDTO dao : list) {
	      logger.info(dao.getBoardNo() + ":" + dao.getTitle());
	    }
	  }
	  
	  @Test
	  public void testDynamic1() throws Exception {

	    Criteria cri = new Criteria();
	    cri.setPage(1);
	    cri.setKeyword("9");
	    cri.setSearchType("tc");
	    
	    logger.info("=====================================");
	    
	    List<BoardDTO> list = dao.listSearch_tc(cri);

	    for (BoardDTO BoardDTO : list) {
	      logger.info(BoardDTO.getBoardNo() + ": " + BoardDTO.getTitle());
	    }

	    logger.info("=====================================");

	    logger.info("COUNT: " + dao.listSearchCount_tc(cri));
	  }
	  @Test
		public void Testlike() {
			//for(int i=201; i<=230; i++) {
			BoardLikeDTO board = new BoardLikeDTO();
			board.setBoardNo(244);
			board.setUserNo(4);
			dao.createlike(board);

			logger.info("좋아요 등록 완료~~~~");
			logger.info(board.toString());
			//}
		}
	  
}
