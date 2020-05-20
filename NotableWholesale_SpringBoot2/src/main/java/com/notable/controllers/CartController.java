package com.notable.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// if cart doesn't exist then create the cart
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		Product prod = (Product) session.getAttribute("product");
		String quant = request.getParameter("qty-1");
		LineItem li = new LineItem();
		li.setProduct(prod);
		li.setQuantity(Integer.parseInt(quant));
		System.out.println(li.getTotal());
		if (cart == null /* && user != null */) {
			// Create line item
			// add to cart
			cart = new Cart();
		}
		System.out.println(cart == null);
		cart.addItem(li);
		
		cart.setTotal();
		
		session.setAttribute("cart", cart);
		return showCart(request, response);
	}

	@PostMapping("removeItem")
	public String removeFromCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String name = request.getParameter("name");

		// assuming unique product names
		Product product = new Product();
		product.setName(name);

		// removes product from cart
		if (product != null && cart != null) {
			LineItem lineItem = new LineItem();
			lineItem.setProduct(product);
			cart.removeItem(lineItem);
		}
		
		cart.setTotal();
		
		// set "new" cart
		session.setAttribute("cart", cart);
		return showCart(request, response);
	}

	@PostMapping("updateItem")
	public String updateCart(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String quantity = request.getParameter(name);
		int qty = Integer.parseInt(quantity);
		Double myPrice = Double.parseDouble(price);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		// instantiate new dummy holders
		Product myProduct = new Product();
		LineItem li = new LineItem();
		li.setQuantity(qty);
		li.setProduct(myProduct);

		myProduct.setName(name);
		myProduct.setPrice(myPrice);
		// iterate through cart to remove old lineitem and add new one
		for (LineItem l : cart.getItems()) {
			// found case
			if (l.getProduct().getName().contentEquals(name)) {
				cart.removeItem(l);
				cart.addItem(li);
				break;
			}
		}
		
		cart.setTotal();
		
		session.setAttribute("cart", cart);
		return showCart(request, response);
	}
}
