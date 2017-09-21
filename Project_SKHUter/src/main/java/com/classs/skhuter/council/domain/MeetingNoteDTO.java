package com.classs.skhuter.council.domain;

import java.util.Date;

public class MeetingNoteDTO {
	private int meetingNoteNo;
	private int userNo;
	private String title;
	private String fileName;
	private String uuidName;
	private String originName;
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
