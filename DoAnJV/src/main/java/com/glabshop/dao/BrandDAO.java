package com.glabshop.dao;

import java.util.List;

import com.glabshop.entity.Brand;

public interface BrandDAO {
	Brand findById(Integer id);

	List<Brand> findAll();

	Brand create(Brand entity);

	void update(Brand entity);

	Brand delete(Integer id);
}
