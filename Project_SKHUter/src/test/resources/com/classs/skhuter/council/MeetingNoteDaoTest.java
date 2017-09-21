package com.classs.skhuter.council;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.council.dao.MeetingNoteDAO;
import com.classs.skhuter.notice.dao.VoteDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MeetingNoteDaoTest {
	
	@Inject
	private MeetingNoteDAO dao;
	
	Logger logger = Logger.getLogger(MeetingNoteDaoTest.class);

	@Test
	public void TestRegister() {
		
	}
}
