package com.bsilx.model;

public class IngrePriceDTO {

	private String ingre_name;
	private int ingre_price;
	private String ingre_year;
	private String ingre_month;
	private String ingre_day;
	private String ingre_market;
	
	// 생성자
	public IngrePriceDTO(String ingre_name, int ingre_price, String ingre_year, String ingre_month, String ingre_day,
			String ingre_market) {
		this.ingre_name = ingre_name;
		this.ingre_price = ingre_price;
		this.ingre_year = ingre_year;
		this.ingre_month = ingre_month;
		this.ingre_day = ingre_day;
		this.ingre_market = ingre_market;
	}
	
	public IngrePriceDTO(String ingre_name, String ingre_year, String ingre_month, String ingre_day) {
		this.ingre_name = ingre_name;
		this.ingre_year = ingre_year;
		this.ingre_month = ingre_month;
		this.ingre_day = ingre_day;
	}

	public IngrePriceDTO(String ingre_name) {
		this.ingre_name = ingre_name;
	}
	
	
	// getter, setter
	public String getIngre_name() {
		return ingre_name;
	}

	public void setIngre_name(String ingre_name) {
		this.ingre_name = ingre_name;
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
