package com.classs.skhuter.board.dao;

import java.util.List;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;

/**
 ** 게시판 댓글 관련 DB에서 데이터를 가져와 모델 생성
 **/

public interface ReplyDAO {

	/** 댓글 리스트 보여주기 **/
	public List<ReplyDTO> listAllReply(int boardNo) throws Exception;

	/** 댓글 등록 **/
	public void createReply(ReplyDTO reply) throws Exception;

	/** 댓글 삭제 **/
	public void deleteReply(int replyNo) throws Exception;

}