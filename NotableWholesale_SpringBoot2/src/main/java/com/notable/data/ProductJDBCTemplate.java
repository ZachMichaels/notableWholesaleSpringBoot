package com.notable.data;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.notable.business.Product;

@Repository
public class ProductJDBCTemplate implements ProductDAO {

	private DataSource dataSource;
	@Autowired
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public void create(int productId, String name, String description, double price) {
		String SQL = "insert into Products (name, description, price) values (?, ?, ?)";
		jdbcTemplateObject.update(SQL, name, description, price);
		System.out.println("Created Record Name = " + name + ", Desc = " + description + ", Price = " + price);
		return;
	}

	public Product getProduct(Integer id) {
		String SQL = "select * from Products where productId = " + id;
		Product prod = jdbcTemplateObject.queryForObject(SQL, new ProductMapper());

		return prod;
	}

	public List<Product> productList() {
		String SQL = "select * from Products";
		List<Product> products = jdbcTemplateObject.query(SQL, new ProductMapper());
		return products;
	}

	public void delete(String name) {
		String SQL = "delete from Products where name = ?";
		jdbcTemplateObject.update(SQL, name);
		System.out.println("Deleted Product with name = " + name);
		return;
	}

	public void update(int productId, String name, String description, double price) {
		String SQL = "update Products set name = ?, description = ?, price = ? where productId = ?";
		jdbcTemplateObject.update(SQL, name, description, price, productId);
		System.out.println("Updated Product with name = " + name);
		return;
	}

	public void updateCartItem(Integer productId, String name, Double price, Integer stock) {
		String SQL = "update Products set name = ?, price = ?, stock = ? where productId = ?";

		try {
			jdbcTemplateObject.update(SQL, name, price, stock, productId);
			System.out.println("Updated Product with name = " + name);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return;
	}

}
