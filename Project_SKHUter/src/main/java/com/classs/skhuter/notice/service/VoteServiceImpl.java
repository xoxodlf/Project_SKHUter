package com.classs.skhuter.notice.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;

@Service
public class VoteServiceImpl implements VoteService {

	@Inject
	private VoteDAO dao;

	@Override
	public VoteDTO getVote(int voteNo) {
		
		return dao.getVote(voteNo);
	}
	
}
