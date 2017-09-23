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
	private String title;
	private Date regdate;
	private int hitCount;
	private String password;
	private String content;
	private int like;
	private int hate;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardno) {
		this.boardNo = boardno;
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

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getHate() {
		return hate;
	}

	public void setHate(int hate) {
		this.hate = hate;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", title=" + title + ", regdate=" + regdate + ", hitCount=" + hitCount
				+ ", password=" + password + ", content=" + content + ", like=" + like + ", hate=" + hate + "]";
	}
	
}
