package com.classs.skhuter.notice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.classs.skhuter.board.dao.BoardDAO;
import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.user.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class VoteDaoTest {
	
	@Inject
	private VoteDAO dao;
	
	Logger logger = Logger.getLogger(VoteDaoTest.class);
	
	@Test
	public void TestRegister() {
		
		VoteDTO vote = new VoteDTO();
		vote.setTitle("아 진짜 이걸 다시 만들고 있구나.. ㅎㅎㅎ");
		vote.setContent("이런일은 또일어나지않을줄알았찌....");
		vote.setItem1("아이템1");
		vote.setItem2("아이템2");
		vote.setItem3("아이템3");
		vote.setItem4("아이템4");
		vote.setItem5("아이템5");
		vote.setItem6("아이템6");
		
		dao.registeVote(vote);
		
		logger.info("보트생성완료데스네~~~~");
		logger.info(vote.toString());
	}
	
	@Test
	public void TestReader() {
		
		List<VoteDTO> list = new ArrayList<VoteDTO>();
		list = dao.readVote();
	
		
		
			logger.info("리스트 : "+list);
		
	}
}
