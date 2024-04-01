package com.bsilx.model;

public class PriceDTO {

	private String ingre_name;
	private int ingre_seq;
	private int ingre_price;
	
	
	public String getIngre_name() {
		return ingre_name;
	}
	public void setIngre_name(String ingre_name) {
		this.ingre_name = ingre_name;
	}
	public int getIngre_seq() {
		return ingre_seq;
	}
	public void setIngre_seq(int ingre_seq) {
		this.ingre_seq = ingre_seq;
	}
	
	public PriceDTO(String ingre_name, int ingre_seq, int ingre_price) {
		this.ingre_name = ingre_name;
		this.ingre_seq = ingre_seq;
		this.ingre_price = ingre_price;
	}
	
	public PriceDTO(int ingre_seq, int ingre_price) {
		this.ingre_seq = ingre_seq;
		this.ingre_price = ingre_price;
	}

	public int getIngre_price() {
		return ingre_price;
	}
	public void setIngre_price(int ingre_price) {
		this.ingre_price = ingre_price;
	}
	
}
