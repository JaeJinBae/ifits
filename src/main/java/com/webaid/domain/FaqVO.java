package com.webaid.domain;

import java.util.Date;

public class FaqVO {
	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private int cnt;

	public FaqVO() {
		super();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "InformationVO [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", cnt=" + cnt + "]";
	}

}
