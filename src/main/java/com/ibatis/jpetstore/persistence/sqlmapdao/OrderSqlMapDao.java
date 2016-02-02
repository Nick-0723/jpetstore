package com.ibatis.jpetstore.persistence.sqlmapdao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.LineItem;
import com.ibatis.jpetstore.domain.Order;
import com.ibatis.jpetstore.persistence.iface.OrderDao;

@Repository
public class OrderSqlMapDao implements OrderDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Order> getOrdersByUsername(String username) {
		return sqlSessionTemplate.selectList("Order.getOrdersByUsername", username);
	}

	public Order getOrder(int orderId) {
		Order order = sqlSessionTemplate.selectOne("Order.getOrder", orderId);
		List<LineItem> items = sqlSessionTemplate.selectList("LineItem.getLineItemsByOrderId", orderId);
		order.setLineItems(items);
		return order;
	}

	public void insertOrder(Order order) {
		sqlSessionTemplate.insert("Order.insertOrder", order);
		sqlSessionTemplate.insert("Order.insertOrderStatus", order);
		for (int i = 0; i < order.getLineItems().size(); i++) {
			LineItem lineItem = order.getLineItems().get(i);
			lineItem.setOrderId(order.getOrderId());
			sqlSessionTemplate.insert("LineItem.insertLineItem", lineItem);
		}
	}

}
