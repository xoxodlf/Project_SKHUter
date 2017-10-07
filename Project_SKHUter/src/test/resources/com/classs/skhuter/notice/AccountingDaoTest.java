package com.classs.skhuter.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.notice.dao.AccountingDAO;
import com.classs.skhuter.notice.domain.AccountingDTO;
import com.classs.skhuter.util.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class AccountingDaoTest {
	
	@Inject
	private AccountingDAO dao;
	
	Logger logger = Logger.getLogger(AccountingDaoTest.class);
	
	@Test
	public void TestRegist() {
		AccountingDTO accounting = new AccountingDTO();
		
		for(int i = 0;i<100;i++) {
			accounting.setUserNo(1);
			accounting.setContent("Test중입니다");
			accounting.setStatus(0);
			accounting.setPrice(500);
			accounting.setFileName("TestFile.txt");
			accounting.setUuidName("s_TestFile.txt");
			System.out.println(accounting.getUserNo()+" "+accounting.getContent());
		
			dao.register(accounting);
		
			logger.info(accounting.toString());
		}
		
		logger.info("회계내역 테스트 중입니다~!");
	}
	
	@Test
	public void TestListAll() {
		logger.info("ListALl테스트중");
		List<AccountingDTO>list = dao.listAll();
		for(AccountingDTO accounting : list) {
			logger.info(accounting.getAccountNo()+"...."+accounting.getContent()+"...."+accounting.getPrice());
		}
	}
	
	@Test
	public void TestListPage() throws Exception{
		logger.info("회계내역 리스트 불러오기 테스트 중입니다~!");
		int page = 2;
		
		List<AccountingDTO> list = dao.listPage(page);
		
		for(AccountingDTO accounting : list) {
			logger.info(accounting.getAccountNo()+":"+accounting.getContent());
		}
		
	}
	
	@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<AccountingDTO> list = dao.listCriteria(cri);
		
		for(AccountingDTO accounting : list) {
			logger.info(accounting.getAccountNo()+":"+accounting.getContent());
		}
	}
}
