package com.classs.skhuter.notice;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AccountingDaoTest {
	
	@Inject
	private AccountingDAO dao;
	
	Logger logger = Logger.getLogger(AccountingDaoTest.class);
	
	@Test
	public void TestRegist() {
		AccountingDTO accounting = new AccountingDTO();
		
		accounting.setUserNo(1);
		accounting.setContent("Test중입니다");
		accounting.setStatus(1);
		accounting.setPrice(50000);
		accounting.setFileName("TestFile");
		System.out.println(accounting.getUserNo()+" "+accounting.getContent());
		
		dao.register(accounting);
		
		logger.info("회계내역 테스트 중입니다~!");
		logger.info(accounting.toString());
	}
	
//	@Test
//	public void TestListAll() {
//		logger.info("회계내역 리스트 불러오기 테스트 중입니다~!");
//		logger.info(dao.listAll());
//	}
}
