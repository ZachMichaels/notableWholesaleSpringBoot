//package com.notable.controllers;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.notable.business.User;
//import com.notable.data.UserIO;
//
//
//@WebServlet("/register")
//public class UserIOController extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		String url = "/index.jsp";
//		
//		String action = request.getParameter("action");
//		
//		if (action.equals("registerUser")){
//			String firstName = request.getParameter("firstName");
//			String lastName = request.getParameter("lastName");
//			String email = request.getParameter("email");
//			String address1 = request.getParameter("address1");
//			String address2 = request.getParameter("address2");
//			String city = request.getParameter("city");
//			String state = request.getParameter("state");
//			String zip = request.getParameter("zip");
//			String country = request.getParameter("country");
//			String password = request.getParameter("password");
//			
//			User user = new User(0, firstName, lastName, email, address1, address2, city, state, zip, country, password);
//		//	UserIO.add(user);
//			
//			//request.setAttribute("user", user);
//			
//			url = "/views/home.jsp";
//		}
//		
//		getServletContext().getRequestDispatcher(url).forward(request, response);
//	}
//
//	
//}
