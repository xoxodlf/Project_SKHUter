package com.classs.skhuter.board.service;
import java.util.List;

import com.classs.skhuter.board.domain.BoardDTO;
import com.classs.skhuter.board.domain.ReplyDTO;

public interface ReplyService {
	/**댓글 등록**/
	public void createReply(ReplyDTO reply) throws Exception;
	
	/**댓글 삭제**/
	public void deleteReply(int replyNo) throws Exception;
	
	/**댓글 리스트 보여주기**/
	public List<ReplyDTO> listAllReply(int boardNo) throws Exception;

}
