package com.ibatis.jpetstore.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibatis.jpetstore.domain.LineItem;
import com.ibatis.jpetstore.domain.Order;
import com.ibatis.jpetstore.persistence.iface.ItemDao;
import com.ibatis.jpetstore.persistence.iface.OrderDao;
import com.ibatis.jpetstore.persistence.iface.SequenceDao;

@Service
public class OrderService {

	@Resource
	private ItemDao itemDao;
	
	@Resource
	private OrderDao orderDao;
	
	@Resource
	private SequenceDao sequenceDao;

	public void insertOrder(Order order) {
		// Get the next id within a separate transaction
		order.setOrderId(getNextId("ordernum"));

		itemDao.updateAllQuantitiesFromOrder(order);
		orderDao.insertOrder(order);
	}

	public Order getOrder(int orderId) {
		Order order = orderDao.getOrder(orderId);

		for (int i = 0; i < order.getLineItems().size(); i++) {
			LineItem lineItem = (LineItem) order.getLineItems().get(i);
			lineItem.setItem(itemDao.getItem(lineItem.getItemId()));
		}
		return order;
	}

	public List<Order> getOrdersByUsername(String username) {
		return orderDao.getOrdersByUsername(username);
	}

	public int getNextId(String key) {
		return sequenceDao.getNextId(key);
	}

}
