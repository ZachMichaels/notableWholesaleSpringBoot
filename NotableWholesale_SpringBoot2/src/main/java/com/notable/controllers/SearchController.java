package com.notable.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.Product;
import com.notable.data.CategoryMapper;
import com.notable.data.ProductMapper;
import com.notable.util.CookieUtil;

@Controller
public class SearchController {

	@Autowired
	JdbcTemplate jdbc;

	// gets the results based on the user's search term
	@PostMapping("search")
	public String searchResults(String searchTerm, HttpServletRequest request, HttpServletResponse response) {

		List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%'",
				new ProductMapper());
		
		Cookie searchCookie = new Cookie("searchCookie", searchTerm);
		searchCookie.setMaxAge(60 * 60 * 24 * 365 * 2);
		searchCookie.setPath("/");
		response.addCookie(searchCookie);

		HttpSession session = request.getSession();
		session.setAttribute("products", products);

		return "views/search";
	}
	
	// sorts products from search results by price in ascending order
		@GetMapping("sortAscend")
		public String sortAscending(String searchTerm, HttpServletRequest request) {
			
			Cookie[] cookies = request.getCookies();
			searchTerm = CookieUtil.getCookieValue(cookies, "searchCookie");
			
			List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%'",
					new ProductMapper());
			
			Collections.sort(products);
			
			HttpSession session = request.getSession();
			session.setAttribute("products", products);
			
			return "views/search";
		}
		
		// sorts products from search results by price in descending order
		@GetMapping("sortDescend")
		public String sortDescending(String searchTerm, HttpServletRequest request) {
			
			Cookie[] cookies = request.getCookies();
			searchTerm = CookieUtil.getCookieValue(cookies, "searchCookie");
			
			List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%'",
					new ProductMapper());
			
			Collections.sort(products, Collections.reverseOrder());
			
			HttpSession session = request.getSession();
			session.setAttribute("products", products);
			
			return "views/search";
		}
		
		// sorts products from search results by name in alphabetical order
		@GetMapping("sortAlphabet")
		public String sortAlphabetically(String searchTerm, HttpServletRequest request) {
			
			Cookie[] cookies = request.getCookies();
			searchTerm = CookieUtil.getCookieValue(cookies, "searchCookie");
			
			List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%'",
					new ProductMapper());
			
			Collections.sort(products, new Comparator<Product>() {
				@Override
				public int compare(Product p1, Product p2) {
					return p1.getName().compareTo(p2.getName());
				}
			});
			
			HttpSession session = request.getSession();
			session.setAttribute("products", products);
			
			return "views/search";
		}
		
		// sorts products from search results by name in reverse alphabetical order
		@GetMapping("sortRevAlphabet")
		public String sortReverseAlphabetically(String searchTerm, HttpServletRequest request) {
			
			Cookie[] cookies = request.getCookies();
			searchTerm = CookieUtil.getCookieValue(cookies, "searchCookie");
			
			List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%'",
					new ProductMapper());
			
			Collections.sort(products, new Comparator<Product>() {
				@Override
				public int compare(Product p1, Product p2) {
					return p2.getName().compareTo(p1.getName());
				}
			});
			
			HttpSession session = request.getSession();
			session.setAttribute("products", products);
			
			return "views/search";
		}
		
		// filters products from search results by user-inputted min and max price values
		@PostMapping("priceFilterSearch")
		public String priceFilter(String searchTerm, Double minPrice, Double maxPrice, HttpServletRequest request) {
			
			Cookie[] cookies = request.getCookies();
			searchTerm = CookieUtil.getCookieValue(cookies, "searchCookie");
			
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
			
			List<Product> products = jdbc.query("SELECT * FROM products where searchTerms LIKE '%" + searchTerm + "%' AND price > " 
			+ minPrice + " AND price < " + maxPrice, new CategoryMapper());
				
			// if the list returned from db is empty, create a new product with the category, so the 
			// filtering functions
//			if (products.isEmpty()) {
//				Product prod = new Product();
//				prod.setCategory(name);
//				products.add(prod);
//			}
			
			HttpSession session = request.getSession();
			session.setAttribute("products", products);

			return "views/search";
				
		}
	
	
	
	
	
}
