package com.classs.skhuter.board.dao;

import java.util.List;

import com.classs.skhuter.board.domain.ReplyDTO;

public interface ReplyDAO {

  public List<ReplyDTO> listAllReply(int boardNo) throws Exception;

  public void createReply(ReplyDTO reply) throws Exception;

  public void deleteReply(int replyNo) throws Exception;
}