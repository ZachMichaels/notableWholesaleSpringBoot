package com.notable.controllers;

import java.util.ArrayList;
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
	
	@GetMapping("sortAsc")
	public String sortAscending(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products);
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
	@GetMapping("sortDesc")
	public String sortDescending(String name, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "'", new CategoryMapper());
		
		Collections.sort(products, Collections.reverseOrder());
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
	}
	
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
	
	@PostMapping("priceFilter")
	public String priceFilter(String name, Double minPrice, Double maxPrice, HttpServletRequest request) {
		
		List<Product> products = jdbc.query("SELECT * FROM products where category = '" + name + "' AND price > " 
		+ minPrice + " AND price < " + maxPrice, new CategoryMapper());
				
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/category";
			
	}
	
	
	
	

}
