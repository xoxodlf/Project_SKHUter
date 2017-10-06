package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;

public interface VoteDAO { 
	public void registVote(VoteDTO vote);
	public List<VoteDTO> readDoingVote();
	public List<VoteDTO> readDoneVote();
	public void deleteVote(int voteNo);
	public void doVote(VoteListDTO doVote);
	public int countVote(VoteListDTO countVote);
	public void upVote(VoteDTO upVote);
	public int getIsVoteNo(VoteListDTO getIsVote);
}
