package com.notable.data;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notable.business.User;

public final class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		User user = new User();
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setFirstName(rs.getString("firstName"));
		user.setLastName(rs.getString("lastName"));
		user.setStreet(rs.getString("street"));
		user.setCity(rs.getString("city"));
		user.setState(rs.getString("state"));
		user.setZip(rs.getString("zip"));
		user.setUserId(rs.getInt("userId"));
		return user;
	}

}
