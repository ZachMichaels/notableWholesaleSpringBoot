package com.notable.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Product;
import com.notable.business.User;
import com.notable.data.ProductJDBCTemplate;

@Controller
public class SuppliesController {

	
	@Autowired
	ProductJDBCTemplate jdbc;
	
	@PostMapping("addSupplies")
	public String orderSupplies(HttpServletRequest request, Integer id, Integer quantity) {

		System.out.println("In the supplies Contoller");
		System.out.println(id);
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("adminCart");
		Product prod = jdbc.getProduct(id);
	
		LineItem li = new LineItem();
		li.setLineItemId(id);
		li.setProduct(prod);
		li.setQuantity(quantity);
		
		if (cart == null /* && user != null */) {
			// Create line item
			// add to cart
			cart = new Cart();
		}
		
		cart.addItem(li);
		session.setAttribute("adminCart", cart);
		
		System.out.println("Count: " + cart.getCount());
		
		return "views/adminCart";
	}
	
	//@PutMapping(produces = {"application/json"})
	@GetMapping("adminSubmitOrder")
	public ModelAndView submitOrder(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("adminCart");
		
		//save cart to textfile
		File file = new File("adminCart.txt"); 
        
        if(file.delete()) 
        { 
            System.out.println("File deleted successfully"); 
        } 
        else
        { 
            System.out.println("Failed to delete the file"); 
        } 
		
		try {
			FileOutputStream f = new FileOutputStream(new File("adminCart.txt"));
			ObjectOutputStream o = new ObjectOutputStream(f);
			o.writeObject(cart);
			o.close();
			f.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("CART: " + cart.getItems().toString());
		
		
		RestTemplate rt = new RestTemplate();
		String url = "http://localhost:8090/cartsave";
		ResponseEntity<String> response = rt.getForEntity(url, String.class);
		
		String temp = response.getBody();
		System.out.println(temp);
		
		mv.setViewName("views/home");
		mv.addObject("cart", cart);
		
		return mv;
	}
	
	
}
