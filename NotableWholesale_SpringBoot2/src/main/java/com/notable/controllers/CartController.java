package com.notable.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Product;
import com.notable.business.User;
import com.notable.data.ProductJDBCTemplate;

@Controller
public class CartController {
	@Autowired
	private ProductJDBCTemplate jdbc;

	@GetMapping("cart")
	public String showCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String value = (String) session.getAttribute("failedOrder");
		if(value != null && value.equals("seen")) {
			session.setAttribute("failedOrder", null);
		}
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
		int qty = Integer.parseInt(quant);

		Product x = (Product) jdbc.getProduct(prod.getProductId());
		int stock = x.getStock() - qty;

		if (stock > 0) {
			LineItem li = new LineItem();
			li.setProduct(prod);
			li.setQuantity(qty);
			if (cart == null /* && user != null */) {
				// Create line item
				// add to cart
				cart = new Cart();
			}
			prod.setStock(stock);
			jdbc.updateCartItem(prod.getProductId(), prod.getName(), prod.getPrice(), stock);
			cart.addItem(li);
			cart.setTotal();
			session.setAttribute("failedOrder", null);
		} else {
			session.setAttribute("failedOrder", "seen");
			System.out.println("There's not enough item to purchase");
		}

		session.setAttribute("cart", cart);
		return "/views/cart";
	}

	@PostMapping("removeItem")
	public String removeFromCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String name = request.getParameter("name");
		int qty = Integer.parseInt(request.getParameter("quantity"));
		int id = Integer.parseInt(request.getParameter("id"));

		// assuming unique product names
		Product product = new Product();
		product.setName(name);

		// Initialize returning stock to inventory
		Product p = jdbc.getProduct(id);
		System.out.println(p.getName());
		int newQty = p.getStock() + qty;

		// removes product from cart
		if (product != null && cart != null) {
			// Set database
			jdbc.updateCartItem(p.getProductId(), p.getName(), p.getPrice(), newQty);
			// delete from cart
			LineItem lineItem = new LineItem();
			lineItem.setProduct(product);
			cart.removeItem(lineItem);
		}

		if (cart.getCount() == 0) {
			cart = null;
		} else {
			cart.setTotal();
		}

		
		

		// set "new" cart
		session.setAttribute("failedOrder", null);
		session.setAttribute("cart", cart);
		return "/views/cart";
	}

	@PostMapping("updateItem")
	public String updateCart(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		int productId = Integer.parseInt(request.getParameter("id"));
		String quantity = request.getParameter(name);
		int qty = Integer.parseInt(quantity);
		Double myPrice = Double.parseDouble(price);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		
		System.out.println(productId);
		Product old = (Product) jdbc.getProduct(productId);
		int stock = old.getStock() - qty;
		if (stock > 0) {
			jdbc.updateCartItem(productId, name, myPrice, stock);
			// maybe have that in the checkout logic
			// instantiate new dummy holders
			Product myProduct = old;
			myProduct.setStock(stock);
			LineItem li = new LineItem();
			li.setQuantity(qty);
			li.setProduct(myProduct);
			// iterate through cart to remove old lineitem and add new one
			for (LineItem l : cart.getItems()) {
				// found case
				if (l.getProduct().getName().contentEquals(name)) {
					cart.removeItem(l);
					cart.addItem(li);
					break;
				}
			}
			session.setAttribute("failedOrder", null);
		} else {
			session.setAttribute("failedOrder", "seen");
			System.out.println("There's not enough item here to add");
		}

		
		cart.setTotal();
		
		session.setAttribute("cart", cart);
		return "/views/cart";
	}
	
	@PostMapping("removeAdmin")
	public String removeFromAdminCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("adminCart");
		String name = request.getParameter("name");

		// assuming unique product names
		Product product = new Product();
		product.setName(name);

		// removes product from cart
		if (product != null && cart != null) {
			// delete from cart
			LineItem lineItem = new LineItem();
			lineItem.setProduct(product);
			cart.removeItem(lineItem);
		}

		if (cart.getCount() == 0) {
			cart = null;
		} else {
			cart.setTotal();
		}
		// set "new" cart
		session.setAttribute("failedOrder", null);
		session.setAttribute("adminCart", cart);
		return "/views/adminCart";
	}

	@PostMapping("updateAdmin")
	public String updateAdminCart(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String quantity = request.getParameter(name);
		int productId = Integer.parseInt(request.getParameter("id"));
		int qty = Integer.parseInt(quantity);
		Product product = jdbc.getProduct(productId);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("adminCart");
		
		
		LineItem li = new LineItem();
		li.setQuantity(qty);
		li.setProduct(product);
		// iterate through cart to remove old lineitem and add new one
		for (LineItem l : cart.getItems()) {
			// found case
			if (l.getProduct().getName().contentEquals(name)) {
				cart.removeItem(l);
				cart.addItem(li);
				break;
			}
		}
		session.setAttribute("failedOrder", null);
		session.setAttribute("adminCart", cart);
		return "/views/adminCart";
	}
}
