package com.classs.skhuter.notice;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.board.dao.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class VoteDaoTest {
	
	@Inject
	private BoardDAO dao;
	
	Logger logger = Logger.getLogger(VoteDaoTest.class);
	
	@Test
	public void TestRegister() {
		
	}

}
