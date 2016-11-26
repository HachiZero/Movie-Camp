package com.movie.r_msgmodel;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class R_MsgDto {
	DateFormat rformat = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
	
	private String r_ip;
	private String r_id;
	private String r_name;
	private String r_date;
	private String r_msg;
	private String r_msg_count;
	private String r_movie_id;
	private String r_like;
	private String r_movie_name;
	private String good;
	private String bed;
	private String goodcount;
	private String bedcount;
	
	

	public String getR_id() {
		return r_id;
	}


	public void setR_id(String r_id) {
		this.r_id = r_id;
	}


	public String getGood() {
		return good;
	}


	public void setGood(String good) {
		this.good = good;
	}


	public String getBed() {
		return bed;
	}


	public void setBed(String bed) {
		this.bed = bed;
	}


	public String getGoodcount() {
		return goodcount;
	}


	public void setGoodcount(String goodcount) {
		this.goodcount = goodcount;
	}


	public String getBedcount() {
		return bedcount;
	}


	public void setBedcount(String bedcount) {
		this.bedcount = bedcount;
	}


	public String getR_movie_name() {
		return r_movie_name;
	}


	public void setR_movie_name(String r_movie_name) {
		this.r_movie_name = r_movie_name;
	}


	public String getR_movie_id() {
		return r_movie_id;
	}


	public void setR_movie_id(String r_movie_id) {
		this.r_movie_id = r_movie_id;
	}


	public String getR_like() {
		return r_like;
	}


	public void setR_like(String r_like) {
		this.r_like = r_like;
	}


	public String getR_msg_count() {
		return r_msg_count;
	}
	
	
	public void setR_msg_count(String r_msg_count) {
		this.r_msg_count = r_msg_count;
	}
	
	public String getR_ip() {
		return r_ip;
	}
	public void setR_ip(String r_ip) {
		this.r_ip = r_ip;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_msg() {
		return r_msg;
	}
	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
	}
	
	
}
