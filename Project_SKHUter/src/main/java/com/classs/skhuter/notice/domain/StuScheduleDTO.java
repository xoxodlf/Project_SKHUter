package com.classs.skhuter.notice.domain;

public class StuScheduleDTO {
	private int schoolScheduleNo;
	private String content;
	private String startDate;
	private String endDate;
	
	public int getSchoolScheduleNo() {
		return schoolScheduleNo;
	}
	public void setSchoolScheduleNo(int schoolScheduleNo) {
		this.schoolScheduleNo = schoolScheduleNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "StuScheduleDTO [schoolScheduleNo=" + schoolScheduleNo + ", content=" + content + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
}
