package com.classs.skhuter.notice.dao;
import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;

@Repository
public class VoteDAOImpl implements VoteDAO {
	@Inject
	  private SqlSession session;

	  private static String namespace = "com.classs.skhuter.mappers.NoticeMapper";

	@Override
	public List<VoteDTO> readVote() {
	return session.selectList(namespace + ".readVote");
	}

	@Override
	public void registeVote(VoteDTO vote) {
		session.insert(namespace + ".registeVote", vote);
	}
	  
	 

}
