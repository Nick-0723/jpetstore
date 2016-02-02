package com.ibatis.jpetstore.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.Item;
import com.ibatis.jpetstore.domain.LineItem;
import com.ibatis.jpetstore.domain.Order;
import com.ibatis.jpetstore.persistence.iface.ItemDao;

@Repository
public class ItemSqlMapDao implements ItemDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public void updateAllQuantitiesFromOrder(Order order) {
		for (int i = 0; i < order.getLineItems().size(); i++) {
			LineItem lineItem = (LineItem) order.getLineItems().get(i);
			String itemId = lineItem.getItemId();
			Integer increment = new Integer(lineItem.getQuantity());
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("itemId", itemId);
			param.put("increment", increment);
			sqlSessionTemplate.update("Item.updateInventoryQuantity", param);
		}
	}

	public boolean isItemInStock(String itemId) {
		Integer i = sqlSessionTemplate.selectOne("Item.getInventoryQuantity", itemId);
		return (i != null && i.intValue() > 0);
	}

	public List<Item> getItemListByProduct(String productId) {
		return sqlSessionTemplate.selectList("Item.getItemListByProduct", productId);
	}

	public Item getItem(String itemId) {
		Integer i = sqlSessionTemplate.selectOne("Item.getInventoryQuantity", itemId);
		Item item = sqlSessionTemplate.selectOne("Item.getItem", itemId);
		item.setQuantity(i.intValue());
		return item;
	}

}
