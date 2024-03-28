package com.bsilx.model;

public class BookmarkDTO {

	private String lbox_seq;
	private String user_id;
	
	public BookmarkDTO(String lbox_seq, String user_id) {
		this.lbox_seq = lbox_seq;
		this.user_id = user_id;
	}

	public String getLbox_seq() {
		return lbox_seq;
	}

	public void setLbox_seq(String lbox_seq) {
		this.lbox_seq = lbox_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
