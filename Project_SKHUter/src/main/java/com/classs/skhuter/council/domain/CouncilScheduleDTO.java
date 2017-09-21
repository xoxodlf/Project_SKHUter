package com.classs.skhuter.council.domain;

import java.util.Date;

public class CouncilScheduleDTO {
	private int councilScheduleNo;
	private String content;
	private Date startDate;
	private Date endDate;
	
	public CouncilScheduleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouncilScheduleDTO(int councilScheduleNo, String content, Date startDate, Date endDate) {
		super();
		this.councilScheduleNo = councilScheduleNo;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getCouncilScheduleNo() {
		return councilScheduleNo;
	}

	public void setCouncilScheduleNo(int councilScheduleNo) {
		this.councilScheduleNo = councilScheduleNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Override
	public String toString() {
		return "CouncilScheduleDTO [councilScheduleNo=" + councilScheduleNo + ", content=" + content + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
	
}
