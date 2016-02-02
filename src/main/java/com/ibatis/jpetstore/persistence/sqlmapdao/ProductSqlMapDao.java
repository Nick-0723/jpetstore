package com.ibatis.jpetstore.persistence.sqlmapdao;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.Product;
import com.ibatis.jpetstore.persistence.iface.ProductDao;

@Repository
public class ProductSqlMapDao implements ProductDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Product> getProductListByCategory(String categoryId) {
		return sqlSessionTemplate.selectList("Product.getProductListByCategory", categoryId);
	}

	public Product getProduct(String productId) {
		return sqlSessionTemplate.selectOne("Product.getProduct", productId);
	}

	public List<Product> searchProductList(String keywords) {
		Object parameterObject = new ProductSearch(keywords);
		return sqlSessionTemplate.selectList("Product.searchProductList", parameterObject);
	}

	/* Inner Classes */

	public static class ProductSearch {
		private List<String> keywordList = new ArrayList<String>();

		public ProductSearch(String keywords) {
			StringTokenizer splitter = new StringTokenizer(keywords, " ", false);
			while (splitter.hasMoreTokens()) {
				keywordList.add("%" + splitter.nextToken() + "%");
			}
		}

		public List<String> getKeywordList() {
			return keywordList;
		}
	}

}
