package com.bsilx.model;

public class MemberDTO {
	String user_id;
	String user_nick;
	String user_name;
	String user_email;
	String user_phone;

	public MemberDTO(String user_id, String user_nick, String user_name, String user_email, String user_phone) {
		this.user_id = user_id;
		this.user_nick = user_nick;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
	}

	public MemberDTO() {

	}

	public MemberDTO(String user_id, String user_name) {
		this.user_id = user_id;
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

}
