package com.ibatis.jpetstore.persistence.iface;

import java.util.List;

import com.ibatis.jpetstore.domain.Product;

public interface ProductDao {

	List<Product> getProductListByCategory(String categoryId);

	Product getProduct(String productId);

	List<Product> searchProductList(String keywords);

}
