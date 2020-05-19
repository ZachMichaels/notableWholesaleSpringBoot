package com.notable.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Product;
import com.notable.data.CategoryMapper;

@Controller
public class CategoryController {
	
	@Autowired
	JdbcTemplate jdbc;
	
	@GetMapping("category")
	public String displayProductsByCategory(String name, HttpServletRequest request) {

		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	// sorts products by price in ascending order
	@GetMapping("sortAsc")
	public String sortAscending(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products);
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	// sorts products by price in descending order
	@GetMapping("sortDesc")
	public String sortDescending(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products, Collections.reverseOrder());
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	// sorts products by name in alphabetical order
	@GetMapping("sortAlpha")
	public String sortAlphabetically(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
				return p1.getName().compareTo(p2.getName());
			}
		});
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	// sorts products by name in reverse alphabetical order
	@GetMapping("sortRevAlpha")
	public String sortReverseAlphabetically(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products, new Comparator<Product>() {
			@Override
			public int compare(Product p1, Product p2) {
				return p2.getName().compareTo(p1.getName());
			}
		});
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	// filters products by user-inputted min and max price values
	@PostMapping("priceFilter")
	public String priceFilter(String name, Double minPrice, Double maxPrice, HttpServletRequest request) {
		
		System.out.println(name);
		System.out.println(minPrice);
		
		// these if statements validate the min and max price fields
		if (minPrice == null) {
			minPrice = 0.0;
		}
		
		if (maxPrice == null) {
			maxPrice = Double.MAX_VALUE;
		}
		
		if (minPrice > maxPrice) {
			Double temp = maxPrice;
			maxPrice = minPrice;
			minPrice = temp;
		}

		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "' AND price > " 
		+ minPrice + " AND price < " + maxPrice, new CategoryMapper());
			
		// if the list returned from db is empty, create a new product with the category, so the 
		// filtering functions
		if (products.isEmpty()) {
			Product prod = new Product();
			prod.setCategory(name);
			products.add(prod);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);

		return "views/category";
			
	}
	
	
	
	

}
