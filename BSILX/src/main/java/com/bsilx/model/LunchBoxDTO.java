package com.bsilx.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor



public class LunchBoxDTO {

	private int lbox_seq;
	private String lbox_name;
	private String lbox_recipe;
	private String lbox_img;
	private int lbox_price;

	

//	public LunchBoxDTO(int lbox_seq, String lbox_name, String lbox_recipe, String lbox_img, int lbox_price) {
//		
//		this.lbox_seq = lbox_seq;
//		this.lbox_name = lbox_name;
//		this.lbox_recipe = lbox_recipe;
//		this.lbox_img = lbox_img;
//		this.lbox_price = lbox_price;
//	}

	public LunchBoxDTO(String lbox_name, String lbox_recipe, String lbox_img, int lbox_price) {
		this.lbox_name = lbox_name;
		this.lbox_recipe = lbox_recipe;
		this.lbox_img = lbox_img;
		this.lbox_price = lbox_price;
	}

	public LunchBoxDTO(String lbox_name, String lbox_img, int lbox_price) {
		this.lbox_name = lbox_name;
		this.lbox_img = lbox_img;
		this.lbox_price = lbox_price;
	}
	
	public LunchBoxDTO(int lbox_seq, String lbox_name, String lbox_img) {
		this.lbox_seq = lbox_seq;
		this.lbox_name = lbox_name;
		this.lbox_img = lbox_img;
	}
	
	public LunchBoxDTO(int lbox_seq, String lbox_name) {
		this.lbox_seq = lbox_seq;
		this.lbox_name = lbox_name;
	}


	public String getLbox_name() {
		return lbox_name;
	}

	public void setLbox_name(String lbox_name) {
		this.lbox_name = lbox_name;
	}

	public String getLbox_recipe() {
		return lbox_recipe;
	}

	public void setLbox_recipe(String lbox_recipe) {
		this.lbox_recipe = lbox_recipe;
	}

	public String getLbox_img() {
		return lbox_img;
	}

	public void setLbox_img(String lbox_img) {
		this.lbox_img = lbox_img;
	}

	public int getLbox_price() {
		return lbox_price;
	}

	public void setLbox_price(int lbox_price) {
		this.lbox_price = lbox_price;
	}

	public int getLbox_seq() {
		return lbox_seq;
	}

	public void setLbox_seq(int lbox_seq) {
		this.lbox_seq = lbox_seq;
	}

}
