package com.notable.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Order;
import com.notable.business.User;
import com.notable.data.OrderMapper;
import com.notable.data.OrdersJDBCTemplate;

@Controller
public class CheckoutController {

	@Autowired
	OrdersJDBCTemplate jdbc;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@GetMapping("checkout")
	public String checkout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");
		session.setAttribute("cart", cart);
		
		List<User> users = (List<User>) session.getAttribute("users");
		session.setAttribute("users", users);
				
		return "views/checkout";
	}
	
	@PostMapping("purchase")
	public String completePurchase(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");
		
		List<User> users = (List<User>) session.getAttribute("users");
		
		String email = users.get(0).getEmail();
		double price = cart.getTotal();
		String status = "Processing";
		
		int userId = users.get(0).getUserId();
		
		jdbc.updateOrders(email, price, status);
		
		for (LineItem lineItem : cart.getItems()) {
			
			int productId = lineItem.getProduct().getProductId();
			int quantity = lineItem.getQuantity();
			
			jdbc.updateOrderDetails(productId, quantity);
		}
		
		List<Order> order = jdbcTemplate.query("SELECT orderid FROM orders ORDER BY orderid DESC LIMIT 1", new OrderMapper());
		session.setAttribute("order", order);
		
		session.removeAttribute("cart");

		return "views/confirmation";
	}
}
