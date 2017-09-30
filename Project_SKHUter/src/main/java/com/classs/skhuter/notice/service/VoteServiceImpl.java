package com.classs.skhuter.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.classs.skhuter.notice.dao.VoteDAO;
import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;

@Service
public class VoteServiceImpl implements VoteService {

	@Inject
	private VoteDAO dao;

	@Override
	public void registVote(VoteDTO vote) {
		dao.registVote(vote);
	}

	@Override
	public List<VoteDTO> readDoingVote() {
		return dao.readDoingVote();
	}

	@Override
	public void deleteVote(int voteNo) {
		dao.deleteVote(voteNo);
	}

	@Override
	public void doVote(VoteListDTO doVote) {
		dao.doVote(doVote);
	}

	@Override
	public List<VoteDTO> readDoneVote() {
		// TODO Auto-generated method stub
		return dao.readDoneVote();
	}

	@Override
	public int countVote(VoteListDTO countVote) {
		// TODO Auto-generated method stub
		return dao.countVote(countVote);
	}

	
}
