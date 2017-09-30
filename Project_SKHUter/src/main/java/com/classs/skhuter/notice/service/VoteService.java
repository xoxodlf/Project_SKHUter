package com.classs.skhuter.notice.service;

import java.util.List;

import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;

public interface VoteService {

	public void registVote(VoteDTO vote);
	public List<VoteDTO> readDoingVote();
	public List<VoteDTO> readDoneVote();
	public void deleteVote(int voteNo);
	public void doVote(VoteListDTO doVote);
}
