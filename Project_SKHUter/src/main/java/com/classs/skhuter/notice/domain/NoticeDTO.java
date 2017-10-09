package com.classs.skhuter.notice.domain;

import java.sql.Date;

public class NoticeDTO {
	
	private int noticeNo;
	private int userNo;
	private String title;
	private Date regdate;
	private int hitCount;
	private String content;
	private Date modifyDate;
	private int exposure;
	
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getExposure() {
		return exposure;
	}
	public void setExposure(int exposure) {
		this.exposure = exposure;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", userNo=" + userNo + ", title=" + title + ", regdate=" + regdate
				+ ", hitCount=" + hitCount + ", content=" + content + ", modifyDate=" + modifyDate + ", exposure="
				+ exposure + "]";
	}
	
}
