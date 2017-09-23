package com.classs.skhuter.council.domain;

import java.util.Date;

public class MeetingNoteDTO {
	private int meetingNoteNo;
	private int userNo;
	private String title;//게시글의 제목
	private String fileName;//파일의 .txt까지 포함된 이름
	private String uuidName;//랜덤하게 생성된 파일 이름 (파일 중복방지)
	private String originName;//파일 이름의 .txt를 뺀 파일 이름
	private Date regdate;
	
	public MeetingNoteDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MeetingNoteDTO(int meetingNoteNo, int userNo, String title, String fileName, String uuidName,
			String originName, Date regdate) {
		super();
		this.meetingNoteNo = meetingNoteNo;
		this.userNo = userNo;
		this.title = title;
		this.fileName = fileName;
		this.uuidName = uuidName;
		this.originName = originName;
		this.regdate = regdate;
	}

	public int getMeetingNoteNo() {
		return meetingNoteNo;
	}

	public void setMeetingNoteNo(int meetingNoteNo) {
		this.meetingNoteNo = meetingNoteNo;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUuidName() {
		return uuidName;
	}

	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MeetingNoteDTO [meetingNoteNo=" + meetingNoteNo + ", userNo=" + userNo + ", title=" + title
				+ ", fileName=" + fileName + ", uuidName=" + uuidName + ", originName=" + originName + ", regdate="
				+ regdate + "]";
	}
	
}
