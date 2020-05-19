package com.notable.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewUserController {

		@GetMapping("account")
		public String userAccount(Map<String, Object> model ) {
			
			return "accountNew";
		}
	
	
}
