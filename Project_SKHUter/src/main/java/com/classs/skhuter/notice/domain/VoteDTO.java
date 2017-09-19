package com.classs.skhuter.notice.domain;

import java.util.Date;

public class VoteDTO {
	
	private int voteNo;
	private int userNo;
	private Date enrollDate;
	private Date startDate;
	private Date endDate;
	private String title;
	private String content;
	private String item1;
	private String item2;
	private String item3;
	private String item4;
	private String item5;
	private String item6;
	public int getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getItem1() {
		return item1;
	}
	public void setItem1(String item1) {
		this.item1 = item1;
	}
	public String getItem2() {
		return item2;
	}
	public void setItem2(String item2) {
		this.item2 = item2;
	}
	public String getItem3() {
		return item3;
	}
	public void setItem3(String item3) {
		this.item3 = item3;
	}
	public String getItem4() {
		return item4;
	}
	public void setItem4(String item4) {
		this.item4 = item4;
	}
	public String getItem5() {
		return item5;
	}
	public void setItem5(String item5) {
		this.item5 = item5;
	}
	public String getItem6() {
		return item6;
	}
	public void setItem6(String item6) {
		this.item6 = item6;
	}
	@Override
	public String toString() {
		return "VoteDTO [voteNo=" + voteNo + ", userNo=" + userNo + ", enrollDate=" + enrollDate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", title=" + title + ", content=" + content + ", item1=" + item1
				+ ", item2=" + item2 + ", item3=" + item3 + ", item4=" + item4 + ", item5=" + item5 + ", item6=" + item6
				+ "]";
	}
	
	
}
