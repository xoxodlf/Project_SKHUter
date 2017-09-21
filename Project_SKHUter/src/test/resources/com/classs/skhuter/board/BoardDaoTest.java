package com.classs.skhuter.board;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.notice.dao.VoteDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoTest {
	
	@Inject
	private VoteDAO dao;
	
	Logger logger = Logger.getLogger(BoardDaoTest.class);

	@Test
	public void TestRegister() {
		
	}
}
