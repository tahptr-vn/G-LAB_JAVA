package com.glabshop.dao;

import java.util.List;

import com.glabshop.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);

	List<Product> findAll();
	

	Product create(Product entity);

	void update(Product entity);

	Product delete(Integer id);

	List<Product> findByCategoryId(Integer categoryId);
	
	List<Product> findByCategoryName(String categoryName);
	
	List<Product> findByBrandName(String brandName);
	
	List<Product> findByKeywords(String keywords);

	List<Product> findByIds(String ids);

	List<Product> findBySpecial(Integer id);
}
