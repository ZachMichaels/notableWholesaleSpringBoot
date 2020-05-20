/*
 * package com.notable.controllers;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.jdbc.core.JdbcTemplate; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.PostMapping;
 * 
 * 
 * @Controller public class RegisterController {
 * 
 * @Autowired JdbcTemplate jdbc;
 * 
 * @PostMapping("register") public String registerLoginUser (String action,
 * String firstName, String lastName, String street, String city, String state,
 * String zip, String email, String password) { String sqlQuery; sqlQuery =
 * "insert into users(firstname, lastname, street, city, state, zip, email, password) values ('"
 * + firstName + "', '" + lastName + "', '" + street + "', '" + city + "', '" +
 * state + "', '" + zip + "', '" + email + "', '" + password + "')";
 * 
 * jdbc.execute(sqlQuery);
 * 
 * return "views/login";
 * 
 * }
 * 
 * }
 */