package com.glabshop.dao;

import java.util.List;

import com.glabshop.entity.Order;
import com.glabshop.entity.OrderDetail;
import com.glabshop.entity.Product;
import com.glabshop.entity.User;

public interface OrderDAO {
	Order findById(Integer id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order delete(Integer id);

	void create(Order order, List<OrderDetail> details);

	List<Order> findByUser(User user);

	List<Product> findItemsByUser(User user);
}
