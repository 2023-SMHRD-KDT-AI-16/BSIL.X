package com.bsilx.model;

public class IngrePriceDTO {

	private int price_seq;
	private int ingre_seq;
	private int ingre_price;
	private String ingre_year;
	private String ingre_month;
	private String ingre_day;
	private String ingre_market;
	
	// 생성자
	public IngrePriceDTO(int price_seq, int ingre_seq, int ingre_price, String ingre_year, String ingre_month,
			String ingre_day, String ingre_market) {
		this.price_seq = price_seq;
		this.ingre_seq = ingre_seq;
		this.ingre_price = ingre_price;
		this.ingre_year = ingre_year;
		this.ingre_month = ingre_month;
		this.ingre_day = ingre_day;
		this.ingre_market = ingre_market;
	}
	
	// getter, setter
	public int getPrice_seq() {
		return price_seq;
	}
	public void setPrice_seq(int price_seq) {
		this.price_seq = price_seq;
	}
	public int getIngre_seq() {
		return ingre_seq;
	}
	public void setIngre_seq(int ingre_seq) {
		this.ingre_seq = ingre_seq;
	}
	public int getIngre_price() {
		return ingre_price;
	}
	public void setIngre_price(int ingre_price) {
		this.ingre_price = ingre_price;
	}
	public String getIngre_year() {
		return ingre_year;
	}
	public void setIngre_year(String ingre_year) {
		this.ingre_year = ingre_year;
	}
	public String getIngre_month() {
		return ingre_month;
	}
	public void setIngre_month(String ingre_month) {
		this.ingre_month = ingre_month;
	}
	public String getIngre_day() {
		return ingre_day;
	}
	public void setIngre_day(String ingre_day) {
		this.ingre_day = ingre_day;
	}
	public String getIngre_market() {
		return ingre_market;
	}
	public void setIngre_market(String ingre_market) {
		this.ingre_market = ingre_market;
	}
	
	
	
	
	
}
