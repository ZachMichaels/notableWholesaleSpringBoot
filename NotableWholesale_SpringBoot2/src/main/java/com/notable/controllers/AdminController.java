package com.notable.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.notable.business.AdminOrder;

@Controller
public class AdminController {

	// show admins orders
	@GetMapping("adminOrders")
	public String getOrders() {
		
		RestTemplate rt = new RestTemplate();	
		String url = "http://localhost:8090/orders";
		ResponseEntity<AdminOrder> response = rt.getForEntity(url, AdminOrder.class);
		
		AdminOrder order = new AdminOrder();
		order = response.getBody();
		
		return "views/adminOrders";
	}
}
