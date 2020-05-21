package com.notable.data;

import javax.sql.DataSource;

public interface OrdersDAO {

	// initialize datasource
	public void setDataSource(DataSource ds);
	
	public void updateOrders(String email, double price, String status);
	
	public void updateOrderDetails(int productId, int quantity);

}