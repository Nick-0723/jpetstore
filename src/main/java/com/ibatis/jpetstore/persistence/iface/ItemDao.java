package com.ibatis.jpetstore.persistence.iface;

import java.util.List;

import com.ibatis.jpetstore.domain.Item;
import com.ibatis.jpetstore.domain.Order;

public interface ItemDao {

	void updateAllQuantitiesFromOrder(Order order);

	boolean isItemInStock(String itemId);

	List<Item> getItemListByProduct(String productId);

	Item getItem(String itemId);

}
