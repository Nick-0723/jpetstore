package com.ibatis.jpetstore.persistence.iface;

import java.util.List;

import com.ibatis.jpetstore.domain.Category;

public interface CategoryDao {

	List<Category> getCategoryList();

	Category getCategory(String categoryId);

}
