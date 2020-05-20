package com.notable.data;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notable.business.Product;

public class ProductMapper implements RowMapper<Product> {

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {

		Product prod = new Product();
		prod.setProductId(rs.getInt("productId"));
		prod.setName(rs.getString("name"));
		prod.setDescription(rs.getString("description"));
		prod.setPrice(rs.getDouble("price"));
		prod.setImg(rs.getString("imageurl"));
		prod.setCategory(rs.getString("category"));
		prod.setStock(rs.getInt("stock"));
		prod.setSearchTerms(rs.getString("searchTerms"));

		return prod;
	}

}
