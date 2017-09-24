package com.classs.skhuter.board.domain;

import java.sql.Date;

/**
 * 게시판 관련 객체 선언 및 getter(), setter() 메소드 정의
 *  
 * @패키지 : com.classs.skhuter.Board.domain
 * @파일명 : BoardDTO.java
 * @작성자 : 이겨레
 * @작성일 : 2017. 9. 23.
 *
 */
public class BoardDTO {
	private int boardNo;
	private int userNo; 
	private String title;
	private Date regdate;
	private int hitCount;
	private String password;
	private String content;
	private int likeCount;
	private int hateCount;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikecount() {
		return likeCount;
	}

	public void setLikecount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getHateCount() {
		return hateCount;
	}

	public void setHateCount(int hateCount) {
		this.hateCount = hateCount;
	}
	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", userNo=" + userNo + ", title=" + title + ", regdate=" + regdate
				+ ", hitCount=" + hitCount + ", password=" + password + ", content=" + content + ", likeCount="
				+ likeCount + ", hateCount=" + hateCount + "]";
	}
	
	
}
