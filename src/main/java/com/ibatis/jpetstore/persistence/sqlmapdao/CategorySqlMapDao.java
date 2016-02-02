package com.ibatis.jpetstore.persistence.sqlmapdao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.Category;
import com.ibatis.jpetstore.persistence.iface.CategoryDao;

@Repository
public class CategorySqlMapDao implements CategoryDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Category> getCategoryList() {
		return sqlSessionTemplate.selectList("Category.getCategoryList");
	}

	public Category getCategory(String categoryId) {
		return sqlSessionTemplate.selectOne("Category.getCategory", categoryId);
	}

}
