package com.notable.controllers;

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

import com.notable.business.User;
import com.notable.data.UserMapper;

@Controller
public class LoginController {

	@Autowired
	JdbcTemplate jdbc;
	
	

	@PostMapping("login")
	public String loginUser(String email, String password, HttpServletResponse response, HttpServletRequest request) {
		
		// should only be one user in the list
		// Make email unique in the users table to ensure this
		List<User> users = jdbc.query("SELECT * FROM users WHERE email = '" + email + "'",
				new UserMapper());
		
		if (users.isEmpty()) {
			return "views/loginInvalid";
		}
		
		String emailResult = users.get(0).getEmail();
		String passwordResult = users.get(0).getPassword();
		String firstNameResult = users.get(0).getFirstName();
		String lastNameResult = users.get(0).getLastName();
		String streetResult = users.get(0).getStreet();
		
		

		// verifying username and password, and if authenticated will create firstname cookie and login Cookie
		if (emailResult.equals(email) && passwordResult.equals(password)) {
			System.out.println("User is authenticated");
			
			HttpSession session = request.getSession();
			session.setAttribute("users", users);
			
			Cookie firstNameCookie = new Cookie("firstNameCookie", firstNameResult);
			firstNameCookie.setMaxAge(60 * 60 * 24 * 365 * 2);
			firstNameCookie.setPath("/");
			response.addCookie(firstNameCookie);

			boolean makeLoginCookie = true;
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase("loggedInCookie")) {
					cookie.setValue("yes");
					cookie.setPath("/");
					response.addCookie(cookie);
					makeLoginCookie = false;
				}
			}
			if (makeLoginCookie) {
				Cookie loggedInCookie = new Cookie("loggedInCookie", "yes");
				loggedInCookie.setMaxAge(60 * 60 * 24 * 365 * 2);
				loggedInCookie.setPath("/");
				response.addCookie(loggedInCookie);
			}


		} else {
		
			return "views/loginInvalid";
		}
		
		if (emailResult.equals("admin@notable.com")) {
			return "adminIndex";
		}

		return "index";
	}

	@GetMapping("logout")
	public String logOutUser(HttpServletResponse response, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equalsIgnoreCase("loggedInCookie")) {
				cookie.setValue("no");
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			if (cookie.getName().equalsIgnoreCase("firstNameCookie")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}

		}
		
		return "index";

	}

}
