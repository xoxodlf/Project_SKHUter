package com.classs.skhuter.notice.domain;

import java.util.Date;

public class AccountingDTO {
	private int accountNo;
	private int userNo;
	private Date accountDate;
	private String content;
	private int status;
	private int price;
	private String fileName;
	private String uuidName;
	
	public AccountingDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AccountingDTO(int accountNo, int userNo, Date accountDate, String content, int status, int price,
			String fileName, String uuidName) {
		super();
		this.accountNo = accountNo;
		this.userNo = userNo;
		this.accountDate = accountDate;
		this.content = content;
		this.status = status;
		this.price = price;
		this.fileName = fileName;
		this.uuidName = uuidName;
	}

	public int getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getAccountDate() {
		return accountDate;
	}

	public void setAccountDate(Date accountDate) {
		this.accountDate = accountDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	@Override
	public String toString() {
		return "AccountingDTO [accountNo=" + accountNo + ", userNo=" + userNo + ", accountDate=" + accountDate
				+ ", content=" + content + ", status=" + status + ", price=" + price + ", fileName=" + fileName
				+ ", uuidName=" + uuidName + "]";
	}
	
	
}
