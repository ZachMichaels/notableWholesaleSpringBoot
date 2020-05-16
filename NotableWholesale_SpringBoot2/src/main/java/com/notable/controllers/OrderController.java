package com.notable.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notable.business.Cart;
import com.notable.business.LineItem;
import com.notable.business.Product;
import com.notable.business.User;
import com.notable.util.CookieUtil;

import java.util.*;

@WebServlet("/cart")
public class OrderController extends HttpServlet {
//    private static final String "/views/cart.jsp" = ""/views/cart.jsp"";
    
    @Override
    public void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/views/cart.jsp";
        
        String action  = request.getParameter("action");
               
        if (action.equals("Add")) /* requestURI.endsWith("/addItem")*/ {
            url = addItem(request, response);
        } else if (action.equals("Update")) {
            url = updateItem(request, response);
        } else if (action.equals("Remove")) {
            url = removeItem(request, response);
		} else {
			url= showCart(request,response);
		} 

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url=showCart(request, response);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    
    private String showCart(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getCount() == 0|| user == null) {
            request.setAttribute("emptyCart", "Your cart is empty");
        } else {
        	//Read cookies for cart here.
        	request.removeAttribute("emptyCart");
            request.getSession().setAttribute("cart", cart);
        }
        return "/views/cart.jsp";
    }
    
    private String addItem(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null)
            cart = new Cart();
    	String name = request.getParameter("name");
    	String quant = request.getParameter("qty-1");
    	
    	double price = Double.parseDouble(request.getParameter("price"));
     
        Cookie PrinterCookie = new Cookie(name+"Product", quant + "_" + name + "_" + String.valueOf(price));
		PrinterCookie.setMaxAge(60*60*24*365*2);
		PrinterCookie.setPath("/");
		response.addCookie(PrinterCookie);
		
		String cookieValue = PrinterCookie.getValue();
		String cookieName = PrinterCookie.getName();

		System.out.println("cookieName: " + cookieName);
		System.out.println("cookieValue: " + cookieValue);

		String[] arr = cookieValue.split("_");
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
		
		Product myProduct = new Product();
		LineItem li = new LineItem();
		int qty = Integer.parseInt(list.get(0));
		li.setQuantity(qty);
		li.setProduct(myProduct);
		myProduct.setName(list.get(1));
		Double myPrice = Double.parseDouble(list.get(2));
		myProduct.setPrice(myPrice);
		
		cart.addItem(li);
		session.setAttribute("cart", cart);
	
        return "/views/cart.jsp";
    }
    
    private String updateItem(HttpServletRequest request,
            HttpServletResponse response) {
    	String name = request.getParameter("name");
        String quantity = request.getParameter(name);
        HttpSession session = request.getSession();
    	Cart cart = (Cart) session.getAttribute("cart");

        Cookie[] cookies = request.getCookies();
        for(Cookie c:cookies) {
        	if(c.getName().endsWith("Product") && c.getName().startsWith(name)) {
        	String cookieValue = CookieUtil.getCookieValue(cookies, c.getName() ); //1_3D-Printer_2399.99
        	String[] arr = cookieValue.split("_");
        	ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
        	
        	Product myProduct = new Product();
        	LineItem li = new LineItem();
        	
        	int qty = Integer.parseInt(quantity);
        	li.setQuantity(qty);
        	
        	
        	li.setProduct(myProduct);
        	myProduct.setName(list.get(1));
        	Double myPrice = Double.parseDouble(list.get(2));
        	myProduct.setPrice(myPrice);
        	
        	
        	cart.addItem(li);
        	c.setValue(qty + "_" + list.get(1) + "_" + myPrice);
        	System.out.println(c.getValue());
        	response.addCookie(c);
        	}
        }
		session.setAttribute("cart", cart);
		

        return "/views/cart.jsp";
    }
    

    private String removeItem(HttpServletRequest request,
            HttpServletResponse response) {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equalsIgnoreCase(name+"Product")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		
		Cart cart = (Cart) session.getAttribute("cart");
        Product product = new Product();
//        int productId = Integer.parseInt(request.getParameter("productId"));

        
     //   double price = Double.parseDouble(request.getParameter("price"));
//      product.setProductId(productId);
        product.setName(name);


        if (product != null && cart != null) {
            LineItem lineItem = new LineItem();
            lineItem.setProduct(product);
            cart.removeItem(lineItem);
        }
        
        session.setAttribute("cart", cart);
        if(cart.getCount()==0) {
        	return "/views/cartRedirect.jsp";
        }
        return "/views/cart.jsp";
    }
}