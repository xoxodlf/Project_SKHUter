package com.classs.skhuter.notice.dao;

import java.util.List;

import com.classs.skhuter.notice.domain.VoteDTO;
import com.classs.skhuter.notice.domain.VoteListDTO;

public interface VoteDAO { 
	
	/**
	 * 
	 * 투표 등록
	 */
	public void registVote(VoteDTO vote);
	
	/**
	 * 
	 *진행중인 투표 목록불러오기
	 */
	public List<VoteDTO> readDoingVote();
	
	/**
	 * 
	 *완료된 투표 목록불러오기
	 */
	public List<VoteDTO> readDoneVote();
	
	/**
	 * 
	 * 투표 삭제
	 * */
	public void deleteVote(int voteNo);
	
	/**
	 * 
	 * 누가투표했는지저장
	 * */
	public void doVote(VoteListDTO doVote);
	
	/**
	 * 
	 * 투표 세기
	 */
	public int countVote(VoteListDTO countVote);
	
	/**
	 * 
	 *투표수 올리기
	 */
	public void upVote(VoteDTO upVote);
	
	/**
	 * 
	 * 투표한지안한지 여부가져오기
	 */
	public int getIsVoteNo(VoteListDTO getIsVote);
	
	/**
	 * 
	 * 투표한사람 숫자 세오기
	 */
	public int getJoinCount(VoteListDTO getJoinCount);
}
