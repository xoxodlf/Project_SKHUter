package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.VoteDTO;

public interface VoteService {

	public void registeVote(VoteDTO vote);
	public List<VoteDTO> readVote();
}
