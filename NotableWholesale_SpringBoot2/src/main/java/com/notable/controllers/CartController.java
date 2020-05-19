package com.notable.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Product;
import com.notable.business.User;

@Controller
public class CartController {
	
	@GetMapping("cart")
	public String showCart(HttpServletRequest request, HttpServletResponse response) {
		
		return "/views/cart";
	}
	
	@PostMapping("addItem")
	public String addToCart(HttpServletRequest request, HttpServletResponse response) {
		//if cart doesn't exist then create the cart
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        Product prod = (Product) session.getAttribute("product");
    	String quant = request.getParameter("qty-1");
    	LineItem li = new LineItem();
    	li.setProduct(prod);
    	li.setQuantity(Integer.parseInt(quant));
    	System.out.println(li.getTotal());
        if (cart == null /*&& user != null*/) {
        	//Create line item
        	//add to cart
            cart = new Cart();
        }
        System.out.println(cart == null);
        cart.addItem(li);
        session.setAttribute("cart", cart);
        return showCart(request, response);
	}
	
	@PostMapping("removeItem")
	public void removeFromCart() {
		
	}
	
	@PostMapping("updateItem")
	public void updateCart() {
		
	}
}
