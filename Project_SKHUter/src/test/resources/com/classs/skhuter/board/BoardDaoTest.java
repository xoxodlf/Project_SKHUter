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
		BoardDTO board = new BoardDTO();
		board.setUserNo(1);
		board.setTitle("※익명게시판 공지사항입니다※");
		board.setHitCount(0);
		board.setPassword("1234");
		board.setContent("자유롭게 의견 나눌 수 있는 공간입니다. 모두에게 쾌적한 이용을 위해 인신공격성 게시물은 삼가해주세요.");
		board.setLikeCount(8);
		board.setHateCount(0);

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
			BoardLikeDTO board = new BoardLikeDTO();
			board.setBoardNo(245);
			board.setUserNo(4);

			logger.info("좋아요 등록 완료~~~~");
			logger.info(board.toString());
			//}
		}
	  
}
