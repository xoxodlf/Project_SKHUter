package com.classs.skhuter.council;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.council.dao.MeetingNoteDAO;
import com.classs.skhuter.council.domain.MeetingNoteDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MeetingNoteDaoTest {
	
	@Inject
	private MeetingNoteDAO dao;
	
	Logger logger = Logger.getLogger(MeetingNoteDaoTest.class);

	@Test
	public void TestRegister() {
		
		MeetingNoteDTO meetingNote = new MeetingNoteDTO();
		
//		for(int i = 0;i<10;i++) {
			meetingNote.setUserNo(1);
			meetingNote.setTitle("9월 23일 테스트");
			meetingNote.setFileName("17년도 9월 23일 회의록.txt");
			meetingNote.setUuidName("TestTest");
			meetingNote.setOriginName("17년도 9월 23일 회의록");
			
			dao.register(meetingNote);
//		}
		
		
		logger.info("회의록 테스트 중입니다~!");
		logger.info(meetingNote.toString());
	}
	
	@Test
	public void TestListAll() {
		MeetingNoteDTO meetingNote = new MeetingNoteDTO();
		
		logger.info("회의록 리스트 불러오기 테스트 중입니다~!");
		logger.info(dao.listAll());
	}
	
	@Test
	public void TestRemove() {
		
		dao.remove(1);
		
		logger.info("회의록 삭제 테스트 중입니다.");
		logger.info(dao.listAll());
	}
}
