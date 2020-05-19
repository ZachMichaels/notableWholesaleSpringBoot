package com.notable.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Cart;
import com.notable.business.User;

@Controller
public class CartController {
	
	@GetMapping("cart")
	public String showCart() {
		return "/views/cart";
	}
	
	@PostMapping("addItem")
	public void addToCart(HttpServletRequest request, HttpServletResponse response) {
		//if cart doesn't exist then create the cart
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null && user == null) {
            request.setAttribute("emptyCart", "Your cart is empty");
        } else {
        	//Read cookies for cart here.
        	request.removeAttribute("emptyCart");
            request.getSession().setAttribute("cart", cart);
        }
        showCart();
	}
	
	@PostMapping("removeItem")
	public void removeFromCart() {
		
	}
	
	@PostMapping("updateItem")
	public void updateCart() {
		
	}
}
