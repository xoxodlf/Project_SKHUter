package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.VoteDTO;

public interface VoteDAO {
	public void registeVote(VoteDTO vote);
	public List<VoteDTO> readVote();
	
}
