package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;

@Service
public class VoteServiceImpl implements VoteService {

	@Inject
	private VoteDAO dao;

	@Override
	public void registeVote(VoteDTO vote) {
		dao.registeVote(vote);
	}

	@Override
	public List<VoteDTO> readVote() {
		return dao.readVote();
	}

	
}
