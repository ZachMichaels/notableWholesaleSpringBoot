package com.notable.data;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notable.business.Product;

public class CategoryMapper implements RowMapper<Product>{

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Product product = new Product();
		
		product.setName(rs.getString("name"));
		product.setDescription(rs.getString("description"));
		product.setPrice(Double.parseDouble(rs.getString("price")));
		product.setImg(rs.getString("imageurl"));
		product.setStock(Integer.parseInt(rs.getString("stock")));
		product.setCategory(rs.getString("category"));
		
		return product;
	}

}
