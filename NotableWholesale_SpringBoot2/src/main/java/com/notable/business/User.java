package com.notable.business;

import java.io.Serializable;

public class User implements Serializable {
	
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private String street;
	private String city;
	private String state;
	private String zip;
	private String password;

	

	/*
	 * public User(int userId, String firstName, String lastName, String email,
	 * String street, String city, String state, String zip, String password) {
	 * super(); this.userId = userId; this.firstName = firstName; this.lastName =
	 * lastName; this.email = email; this.street = street; this.city = city;
	 * this.state = state; this.zip = zip; this.password = password; }
	 */
	
	public User() {
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
}