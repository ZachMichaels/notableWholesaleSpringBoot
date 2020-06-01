package com.notable.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.notable.business.Product;
import com.notable.data.ProductMapper;

@Controller
public class AdminSortController {

	@Autowired
	JdbcTemplate jdbc;
	
	
	@GetMapping("adminSortAsc")
	public String sortAscending(HttpServletRequest request, String name) {
		
		List<Product> products = jdbc.query("SELECT * FROM products ORDER BY " + name + " ASC", new ProductMapper());
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/admin";
	}
	
	@GetMapping("adminSortDesc")
	public String sortDescending(HttpServletRequest request, String name) {
		
		List<Product> products = jdbc.query("SELECT * FROM products ORDER BY " + name + " DESC", new ProductMapper());
		
		HttpSession session = request.getSession();
		session.setAttribute("products", products);
		
		return "views/admin";
	}


}
