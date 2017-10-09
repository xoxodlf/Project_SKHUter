package com.classs.skhuter.board.domain;

/**
 ** 좋아요 관련 객체 선언 및 getter(), setter() 메소드 정의
 */

public class BoardLikeDTO {
	private int boardNo;
	private int userNo;
	
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
	@Override
	public String toString() {
		return "BoardLikeDTO [boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}
	
	
}
