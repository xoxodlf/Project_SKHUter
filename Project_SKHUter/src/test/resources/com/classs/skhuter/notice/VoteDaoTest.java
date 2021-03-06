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
import com.classs.skhuter.notice.domain.VoteListDTO;
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
		vote.setTitle("투표 제목");
		vote.setContent("투표 내용");
		vote.setItem1("1");
		vote.setItem2("2");
		vote.setItem3("3");
		vote.setItem4("4");
		vote.setItem5("5");
		vote.setItem6("6");
		
		dao.registVote(vote);
		
		logger.info("투표 등록 완료~~~~");
		logger.info(vote.toString());
	}
	
	@Test
	public void TestReader() {
		
		List<VoteDTO> list = new ArrayList<VoteDTO>();
		list = dao.readDoingVote();
	
		
		
			logger.info("由ъ뒪�듃 : "+list);
		
	}
	
	@Test
	public void TestDelecter() {
		dao.deleteVote(1);
	}
	@Test
	public void TestDoVote() {
		
		VoteListDTO doVote = new VoteListDTO();
		doVote.setUserNo(1);
		doVote.setVoteNo(2);
		doVote.setSelectItem("123123");
		dao.doVote(doVote);
		
		logger.info("�닾�몴�븯湲곕뜲�뒪�꽕~~~~");
		logger.info(doVote.toString());
	}
	
	@Test
	public void testCount() {
		VoteListDTO countVote = new VoteListDTO();
		int countNum;
		countVote.setVoteNo(101);
		countVote.setUserNo(2);
		countNum=dao.countVote(countVote);
		logger.info(countNum);
	}
	
	@Test
	public void testupvote() {
		VoteDTO upvote = new VoteDTO();
		upvote.setVoteNo(121);
		upvote.setItem1Count(1);
		upvote.setItem2Count(0);
		upvote.setItem3Count(0);
		upvote.setItem4Count(0);
		upvote.setItem5Count(0);
		upvote.setItem6Count(0);
		
		dao.upVote(upvote);
		logger.info("정보 수정 완료!");
	}
	
	@Test
	public void testcount2() {
		VoteListDTO countVote = new VoteListDTO();
		countVote.setVoteNo(1);
		countVote.setUserNo(2);
		logger.info("시작");
		int isVote=dao.getIsVoteNo(countVote);
		
		logger.info("값 넣었다");
		logger.info(""+isVote);
	}
	
}
