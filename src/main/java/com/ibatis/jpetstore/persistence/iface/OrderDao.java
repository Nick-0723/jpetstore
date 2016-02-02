package com.ibatis.jpetstore.persistence.iface;

import java.util.List;

import com.ibatis.jpetstore.domain.Order;

public interface OrderDao {

	List<Order> getOrdersByUsername(String username);

	Order getOrder(int orderId);

	void insertOrder(Order order);

}
