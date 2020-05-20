package com.notable.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import com.notable.data.UserJDBCTemplate;


@Controller
public class UserController {


	@Autowired
	UserJDBCTemplate jdbc;
	
	@PostMapping("register")
	public String registerUser (String firstName, String lastName, String street, String city, 
			String state, String zip, String email, String password) {
		jdbc.create(firstName, lastName, street, city, state, zip, email, password);
		return "views/login";
			
	}
	
	@PostMapping("update")
	public String editProfile (Integer id, String firstName, String lastName, String street, String city, 
			String state, String zip, String email) {
		jdbc.update(id, firstName, lastName, street, city, state, zip, email);
		return "views/account";
	}
	
}
