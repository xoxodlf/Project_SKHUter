package com.classs.skhuter.board.domain;

import java.sql.Date;

public class ReplyDTO {
	private int replyNo;
	private int boardNo;
	private int userNo; 
	private Date regdate;
	private String content;
	
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [replyNo=" + replyNo + ", boardNo=" + boardNo + ", userNo=" + userNo + ", regdate=" + regdate
				+ ", content=" + content + "]";
	}

}
