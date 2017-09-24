package com.classs.skhuter.notice.dao;
import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;

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
	public void registVote(VoteDTO vote) {
		session.insert(namespace + ".registVote", vote);
	}

	@Override
	public void deleteVote(int voteNo) {
		session.delete(namespace+".deleteVote",voteNo);
	}

	@Override
	public void doVote(VoteListDTO doVote) {
		session.insert(namespace+".doVote",doVote);
	}
	  
	 

}
