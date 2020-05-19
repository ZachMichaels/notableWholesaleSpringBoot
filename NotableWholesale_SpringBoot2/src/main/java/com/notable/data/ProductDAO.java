package com.notable.data;

import java.util.List;

import javax.sql.DataSource;

import com.notable.business.Product;

public interface ProductDAO {

	// initialize datastuff
	public void setDataSource(DataSource ds);
	//Create Product object
	public void create(int productId, String name, String description, double price);
	//get the products from a product id
	public Product getProduct(Integer productId);
	//lists out the products
	public List<Product> productList();
	//ostensibly delete product given a name
	public void delete(String name);
	//ostensibly update product with new information
	public void update(int productId, String name, String description, double price);
}
