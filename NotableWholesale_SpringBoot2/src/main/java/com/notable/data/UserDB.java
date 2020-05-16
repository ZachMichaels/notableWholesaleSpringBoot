package com.notable.data;

import java.sql.*;

import com.notable.business.User;

public class UserDB {
	public static void insert(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query
                = "INSERT INTO User (firstName, lastName, address1, address2, city, state, zip, country, email, password)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getAddress1());
            ps.setString(4, user.getAddress2());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getState());
            ps.setString(7, user.getZip());
            ps.setString(8, user.getCountry());
            ps.setString(9, user.getEmail());
            ps.setString(10, user.getPassword());
            
            ps.executeUpdate();
        }        
         catch (SQLException e) {
            System.err.println(e);
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
	
	public static boolean emailExists(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT Email FROM User "
                + "WHERE Email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    } 
	
	public static boolean authenticateUser(String email, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Statement statement = null;
        ResultSet results = null;
        
        try {
			statement = connection.createStatement();
			results = statement.executeQuery("SELECT email, password FROM user WHERE email = '" + email +"'");
			
			// in case user submits empty login form
			if(email.equals("")) {
				return false;
			}
			
			String emailResult = "";
			String passwordResult = "";
			
			while(results.next()) {
				emailResult = results.getString("email");
				passwordResult = results.getString("password");
//				System.out.println(emailResult);
//				System.out.println(passwordResult);
			}
			
			if (emailResult.equals(email) && passwordResult.equals(password)) {
				return true;
			}
			
			return false;
		} catch (SQLException e) {
            System.err.println(e);
            return false;
        } 
        finally {
        	DBUtil.closeResultSet(results);
        	DBUtil.closeStatement(statement);
        	pool.freeConnection(connection);
        }
  }
	
	public static User getUser(String email) {
		ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Statement statement = null;
        ResultSet results = null;
        User user = null;
        
        try {
			statement = connection.createStatement();
			results = statement.executeQuery("SELECT * FROM user WHERE email = '" + email +"'");
			
			while(results.next()) {
				String firstName = results.getString("firstName");
				String lastName = results.getString("lastName");
				String address1 = results.getString("address1");
				String address2 = results.getString("address2");
				String city = results.getString("city");
				String state = results.getString("state");
				String zip = results.getString("zip");
				String country = results.getString("country");
				String password = results.getString("password");
				
				user = new User();
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setAddress1(address1);
				user.setAddress2(address2);
				user.setCity(city);
				user.setState(state);
				user.setZip(zip);
				user.setCountry(country);
				user.setEmail(email);
				user.setPassword(password);
				
				return user;
			}
		} catch (SQLException e) {
            System.err.println(e);
        } 
        finally {
        	DBUtil.closeResultSet(results);
        	DBUtil.closeStatement(statement);
        	pool.freeConnection(connection);
        }
		return user;
	}

}
