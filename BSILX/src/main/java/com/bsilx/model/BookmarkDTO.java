package com.bsilx.model;

public class BookmarkDTO {

	private int lbox_seq;
	private String user_id;
	
	public BookmarkDTO(int lbox_seq, String user_id) {
		this.lbox_seq = lbox_seq;
		this.user_id = user_id;
	}

	public int getLbox_seq() {
		return lbox_seq;
	}

	public void setLbox_seq(int lbox_seq) {
		this.lbox_seq = lbox_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
