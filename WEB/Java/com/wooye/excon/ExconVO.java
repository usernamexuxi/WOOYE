package com.wooye.excon;

import java.sql.Date;

//VO(Value Object)
public class ExconVO {
	
	private int seq;
	private String user_id;
	private String excon_seq;
	private String excon_name;
	private String start_date;
	private String end_date;
	private String place;
	private String genre;

	
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getExcon_seq() {
		return excon_seq;
	}


	public void setExcon_seq(String excon_seq) {
		this.excon_seq = excon_seq;
	}


	public String getExcon_name() {
		return excon_name;
	}


	public void setExcon_name(String excon_name) {
		this.excon_name = excon_name;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}



	
	@Override
	public String toString() {
		return "ExconVO [seq=" + seq + ", user_id=" + user_id+ ", excon_seq=" + excon_seq + ", excon_name=" + excon_name
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", place=" + place + ", genre="+ genre + "]";
	}
}