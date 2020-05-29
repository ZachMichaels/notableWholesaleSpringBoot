package com.notable.business;

public class Resupply {

	private int productId;
	private String name;
	private String category;
	private int amountRequested;

	public Resupply() {

	}
	
	

	public Resupply(int productId, int amountRequested) {
		super();
		this.productId = productId;
		this.amountRequested = amountRequested;
	}



	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAmountRequested() {
		return amountRequested;
	}

	public void setAmountRequested(int amountRequested) {
		this.amountRequested = amountRequested;
	}

	

	@Override
	public String toString() {
		return "Resupply [productId=" + productId + ", amountRequested=" + amountRequested + "]";
	}
	
	

}
