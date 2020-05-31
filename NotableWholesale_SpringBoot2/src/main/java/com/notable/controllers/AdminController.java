package com.notable.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.notable.business.AdminOrder;
import com.notable.business.Cart;

@Controller
public class AdminController {

	// show admins orders
	@GetMapping("adminOrders") 
	public String getOrders(HttpServletRequest request) {
		
		RestTemplate rt = new RestTemplate();	
		String url = "http://localhost:8090/orders";
		ResponseEntity<List<AdminOrder>> response = rt.exchange(url, HttpMethod.GET, null, new ParameterizedTypeReference<List<AdminOrder>>() {});
		
		List<AdminOrder> orders = response.getBody();
		
//		if (!orders.isEmpty()) {
//		HttpSession session = request.getSession();
//		session.setAttribute("adminOrder", orders); 
//		
//		}
		
		HttpSession session = request.getSession();
		session.setAttribute("adminOrder", orders); 

		
//		for (AdminOrder order : orders) {
//			System.out.println("Quantity YAY!: " + order.getQuantity());
//		}
		
		//System.out.println("Quantity: " + order.getQuantity());
		
		return "views/adminOrders";
	}
}
