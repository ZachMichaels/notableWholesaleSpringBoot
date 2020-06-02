package com.notable.controllers;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.notable.business.OrderDetails;

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
		
		HashMap<Integer, List<AdminOrder>> hmap = new HashMap<Integer, List<AdminOrder>>();
		List<AdminOrder> itemsPerOrder = new ArrayList<AdminOrder>();
		int tempOrderId = 0;

		for (AdminOrder od : orders) {
			int orderId = od.getOrderId();
			if (orderId != tempOrderId) {
				if (tempOrderId != 0) {
					List<AdminOrder> itemsPerOrderTemp = new ArrayList<AdminOrder>();
					for (AdminOrder item : itemsPerOrder) {
						itemsPerOrderTemp.add(item);
					}
					hmap.put(tempOrderId, itemsPerOrderTemp);
				}
				tempOrderId = orderId;
				itemsPerOrder.clear();
			}

			itemsPerOrder.add(od);
		}

		List<AdminOrder> itemsPerOrderTemp = new ArrayList<AdminOrder>();
		for (AdminOrder item : itemsPerOrder) {
			itemsPerOrderTemp.add(item);
			hmap.put(tempOrderId, itemsPerOrderTemp);
		}

		System.out.println(hmap.toString());
		session.setAttribute("adminOrdersHash", hmap);

		
//		for (AdminOrder order : orders) {
//			System.out.println("Quantity YAY!: " + order.getQuantity());
//		}
		
		//System.out.println("Quantity: " + order.getQuantity());
		
		return "views/adminOrders";
	}
	
}
