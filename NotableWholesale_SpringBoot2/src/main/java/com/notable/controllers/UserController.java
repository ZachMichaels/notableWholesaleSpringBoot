package com.notable.controllers;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.notable.business.User;
import com.notable.data.UserJDBCTemplate;
import com.notable.data.UserMapper;

@Controller
public class UserController extends HttpServlet {

	@Autowired
	UserJDBCTemplate jdbc;

	@PostMapping("register")
	public String registerUser(String firstName, String lastName, String street, String city, String state, String zip,
			String email, String password) {
		jdbc.create(firstName, lastName, street, city, state, zip, email, password);
		return "views/login";

	}

	@PostMapping("update")
	public String editProfile(Integer id, String firstName, String lastName, String street, String city, String state,
			String zip, String email, HttpServletRequest request) {
		
		jdbc.update(id, firstName, lastName, street, city, state, zip, email);
		
		HttpSession session = request.getSession();
		session.setAttribute("users", jdbc.userList(email));

		return "views/account";
	}


}
