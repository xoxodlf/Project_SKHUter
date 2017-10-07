package com.classs.skhuter.council;

import java.util.Date;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.council.dao.CouncilScheduleDAO;
import com.classs.skhuter.council.domain.CouncilScheduleDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CouncilScheduleDaoTest {
	
	@Inject
	private CouncilScheduleDAO dao;
	
	Logger logger = Logger.getLogger(CouncilScheduleDaoTest.class);
	
	/** 일정 등록 테스트 */
	@Test
	public void TestRegister() {
		
		CouncilScheduleDTO councilSchedule = new CouncilScheduleDTO();
		councilSchedule.setContent("한솥밥 튜터링");
		councilSchedule.setStartDate("2017-10-07");
		councilSchedule.setEndDate("2017-10-07");
		
		dao.register(councilSchedule);
		
		logger.info("일정 등록 완료~~~~~~!");
	}
	
}
