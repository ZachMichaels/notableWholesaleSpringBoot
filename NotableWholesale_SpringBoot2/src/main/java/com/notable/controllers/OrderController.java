package com.notable.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.notable.business.OrderDetails;
import com.notable.business.User;
import com.notable.data.OrderDetailsMapper;

@Controller
public class OrderController {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@GetMapping("myOrders")
	public String showMyOrders(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		List<User> user = (List<User>) session.getAttribute("users");
		int userId = user.get(0).getUserId();
		System.out.println(userId);
		
		List<OrderDetails> orderDetails = jdbcTemplate.query("SELECT orderdetails.OrderID, products.name, products.price, orderdetails.Quantity, (select products.price * orderdetails.Quantity) as 'ProductTotal', orders.amount as 'OrderTotal', orders.userId\r\n" + 
				"FROM orderdetails\r\n" + 
				"INNER JOIN products on orderdetails.ProductID = products.productId\r\n" + 
				"INNER JOIN orders on orderdetails.OrderID = orders.OrderID\r\n" + 
				"WHERE orders.userId = '" + userId + "' ORDER BY orderdetails.OrderId",
				new OrderDetailsMapper());
		
		
		
		
		session.setAttribute("orderDetails", orderDetails);
		
//		int i = 0;
//		for (OrderDetails od : orderDetails) {
//			if () {
//				
//			}
//		}
		

		return "views/myOrders";
	}

}