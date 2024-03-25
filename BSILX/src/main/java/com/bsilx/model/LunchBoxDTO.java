package com.bsilx.model;

import java.util.ArrayList;

public class LunchBoxDTO {
	
	private String lbox_name;
	private String lbox_recipe;
	private String lbox_img;
	private int lbox_price;
	
	public LunchBoxDTO(String lbox_name, String lbox_recipe, String lbox_img, int lbox_price) {
		this.lbox_name = lbox_name;
		this.lbox_recipe = lbox_recipe;
		this.lbox_img = lbox_img;
		this.lbox_price = lbox_price;
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
	
	
	

}
