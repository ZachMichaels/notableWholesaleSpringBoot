package com.notable.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.User;

@Controller
public class CheckoutController {

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
		
		return "views/confirmation";
	}
}
