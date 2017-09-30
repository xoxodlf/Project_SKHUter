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
		vote.setTitle("�븘 吏꾩쭨 �씠嫄� �떎�떆 留뚮뱾怨� �엳援щ굹.. �뀕�뀕�뀕");
		vote.setContent("�씠�윴�씪�� �삉�씪�뼱�굹吏��븡�쓣以꾩븣�븯李�....");
		vote.setItem1("�븘�씠�뀥1");
		vote.setItem2("�븘�씠�뀥2");
		vote.setItem3("�븘�씠�뀥3");
		vote.setItem4("�븘�씠�뀥4");
		vote.setItem5("�븘�씠�뀥5");
		vote.setItem6("�븘�씠�뀥6");
		
		dao.registVote(vote);
		
		logger.info("蹂댄듃�깮�꽦�셿猷뚮뜲�뒪�꽕~~~~");
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
		countVote.setSelectItem("wefwef");
		countNum=dao.countVote(countVote);
		logger.info(countNum);
	}
}
