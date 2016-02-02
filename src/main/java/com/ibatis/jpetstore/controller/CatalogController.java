/**
 * @Date 2016年1月30日 上午11:02:00
 * @author tangq
 * @version V1.0
 * 
 */
package com.ibatis.jpetstore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibatis.jpetstore.domain.Category;
import com.ibatis.jpetstore.domain.Item;
import com.ibatis.jpetstore.domain.Product;
import com.ibatis.jpetstore.service.CatalogService;

/** 
 *  
 */
@Controller
public class CatalogController {

	private static final Logger logger = LoggerFactory.getLogger(CatalogController.class);

	@Resource
	private CatalogService catalogService;
	
	@RequestMapping("shop/index")
	public String index(ModelMap map) {
		return "catalog/Main.jsp";
	}

	@RequestMapping("shop/viewProduct")
	public String viewProduct(@RequestParam String productId, ModelMap map) {
		List<Item> itemList = catalogService.getItemListByProduct(productId);
		Product product = catalogService.getProduct(productId);
		map.put("itemList", itemList);
		map.put("product", product);
		return "catalog/Product.jsp";
	}

	@RequestMapping("shop/searchProducts")
	public String searchProducts(@RequestParam String keyword, ModelMap map) {
		if (keyword == null || keyword.length() < 1) {
			logger.error("Please enter a keyword to search for, then press the search button.");
		} else {
			List<Product> productList = catalogService.searchProductList(keyword.toLowerCase());
			map.put("productList", productList);
		}
		return "catalog/SearchProducts.jsp";
	}

	@RequestMapping("shop/viewCategory")
	public String viewCategory(@RequestParam String categoryId, ModelMap map) {
		List<Product> productList = catalogService.getProductListByCategory(categoryId);
		Category category = catalogService.getCategory(categoryId);
		map.put("productList", productList);
		map.put("category", category);
		return "catalog/Category.jsp";
	}

	@RequestMapping("shop/viewItem")
	public String viewItem(@RequestParam String itemId, ModelMap map) {
		Item item = catalogService.getItem(itemId);
		Product product = item.getProduct();
		map.put("item", item);
		map.put("product", product);
		return "catalog/Item.jsp";
	}

}
