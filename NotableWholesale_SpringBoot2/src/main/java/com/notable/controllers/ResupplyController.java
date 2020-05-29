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
public class ResupplyController {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@GetMapping("resupply")
	public String getAllProducts(HttpServletRequest request) {

		List<Product> products = jdbcTemplate.query("SELECT * FROM products", new ProductMapper());

		HttpSession session = request.getSession();
		session.setAttribute("products", products);

		return "views/admin";
	}

}
