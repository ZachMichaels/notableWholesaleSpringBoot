package com.notable.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.notable.business.AdminOrder;
import com.notable.business.Cart;
import com.notable.business.Product;
import com.notable.data.ProductJDBCTemplate;

@RestController
public class CartRestController {

	@Autowired
	ProductJDBCTemplate jdbc;

	@RequestMapping("cartsave")
	@ResponseBody
	public Cart cartReturn(HttpServletRequest request) throws IOException, ClassNotFoundException {

		Cart cart = new Cart();
		FileInputStream fi = new FileInputStream(new File("adminCart.txt"));
		ObjectInputStream oi = new ObjectInputStream(fi);
		cart = (Cart) oi.readObject();
		oi.close();
		fi.close();

		System.out.println("Inside CartRestController in the Stizzore");
		System.out.println("CART: " + cart.getItems().toString());

		return cart;
	}

	@RequestMapping("updateInventory") 
	@ResponseBody
	public String updateStock(HttpServletRequest request) { // access orders from supplyworld DB
		RestTemplate rt = new RestTemplate();
		String url = "http://localhost:8090/pending";
		ResponseEntity<ArrayList<AdminOrder>> response = rt.exchange(url, HttpMethod.GET, null,
				new ParameterizedTypeReference<ArrayList<AdminOrder>>() {
				});

		ArrayList<AdminOrder> pendingOrders = response.getBody();

		// stuff orderid and quantity into collection
		HashMap<Integer, Integer> intoDB = new HashMap<Integer, Integer>();
		for (AdminOrder o : pendingOrders) {
			intoDB.put(o.getProductId(), o.getQuantity());
		}

		// get a list of products with the product ids in the pending orders //from
		// notable database
		ArrayList<Product> fromDB = new ArrayList<Product>();
		for (AdminOrder o : pendingOrders) {
			Product p = jdbc.getProduct(o.getProductId());
			fromDB.add(p);
		}

		// update stock with pending order numbers
		for (Map.Entry<Integer, Integer> entry : intoDB.entrySet()) {
			Integer id = entry.getKey(); // product id

			Integer oldStock = 0; // find stock of product id in list
			for (Product p : fromDB) {
				if (id.equals(p.getProductId())) {
					oldStock = p.getStock();// find old stock number
					break;
				}
			}
		// update for new item levels 
		jdbc.update(id, oldStock + entry.getValue()); 
		}
		return "Success";
	}

}
