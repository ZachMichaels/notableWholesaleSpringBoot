package com.notable.data;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.notable.business.User;

@Repository
public class UserJDBCTemplate implements UserDAO {

		private DataSource dataSource;
		@Autowired
		private JdbcTemplate jdbcTemplateObject;

		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
			this.jdbcTemplateObject = new JdbcTemplate(dataSource);
		}

		public void create(String firstName, String lastName, String street, 
				String city, String state, String zip, String email, String password) {
			String SQL = "insert into users (firstName, lastName, street, city, state, zip, email, password) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
			jdbcTemplateObject.update(SQL, firstName, lastName, street, city, state, zip,  email, password);
			System.out.println("Created Account = " + email + ", Password = " + password);
			return;
		}

		public User getUser(Integer id) {
			String SQL = "select * from Users where userId = " + id;
			User user = jdbcTemplateObject.queryForObject(SQL, new UserMapper());
			System.out.println("Selected User= " + user.getEmail() + " from userID= " + id);
			return user;
		}

		public List<User> userList(String email) {
			String SQL = "select * from Users where email = " + '"' + email  + '"';
			List<User> users = jdbcTemplateObject.query(SQL, new UserMapper());
			return users;
		}

		public void delete(String email) {
			String SQL = "delete from Users where email = ?";
			jdbcTemplateObject.update(SQL, email);
			System.out.println("Deleted User with email = " + email);
			return;
		}

		public void update(Integer id, String firstName, String lastName, String street, 
				String city, String state, String zip, String email) {
			String SQL = "update Users set firstName = ?, lastName = ?, street = ?, city = ?, state = ?, zip = ? where userId = ?";
			jdbcTemplateObject.update(SQL, firstName, lastName, street, city, state, zip, id);
			System.out.println("Updated User with email = " + email);
			return;
		}
		
}
