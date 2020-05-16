package com.notable.business;

import java.text.NumberFormat;
import java.io.Serializable;

public class Product implements Serializable {

	//private int productId;
	private String name;
	private double price;

	public Product() {
	}

	/*
	 * public int getProductId() { return productId; }
	 * 
	 * public void setProductId(int productId) { this.productId = productId; }
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		return price;
	}

	public String getPriceCurrencyFormat() {
		NumberFormat currency = NumberFormat.getCurrencyInstance();
		return currency.format(price);
	}

	@Override
	public String toString() {
		return name;
	}

}
