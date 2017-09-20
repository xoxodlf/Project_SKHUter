package com.classs.skhuter.notice.dao;
import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;

@Repository
public class VoteDAOImpl implements VoteDAO {
	@Inject
	  private SqlSession session;

	  private static String namespace = "com.classs.skhuter.mappers.noticeMapper";
	  
	  @Override
	  public VoteDTO getVote(int voteNo) {
		  return session.selectOne(namespace + ".readVote", voteNo);
	  };

}
