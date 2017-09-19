package com.classs.skhuter.user;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.user.dao.UserDAO;
import com.classs.skhuter.user.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoTest {
	
	@Inject
	private UserDAO dao;
	
	Logger logger = Logger.getLogger(UserDaoTest.class);
	
	
	/** 회원가입 테스트 */
	@Test
	public void TestRegister() {
		UserDTO user = new UserDTO();
		user.setId("201434025");
		user.setPassword("1111");
		user.setName("이종윤");
		user.setPhone("010-1111-2222");
		user.setGrade(4);
		user.setIsLeave(0);
		user.setStatus(1);
		user.setSecession(0);
		
		dao.register(user);
		
		logger.info("신규 회원가입 완료~~~~");
		logger.info(user.toString());
	}

}
