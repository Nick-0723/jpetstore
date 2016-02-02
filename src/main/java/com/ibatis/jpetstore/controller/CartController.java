/**
 * @Date 2016年1月30日 上午11:02:00
 * @author tangq
 * @version V1.0
 * 
 */
package com.ibatis.jpetstore.controller;

import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibatis.jpetstore.domain.Cart;
import com.ibatis.jpetstore.domain.CartItem;
import com.ibatis.jpetstore.domain.Item;
import com.ibatis.jpetstore.service.CatalogService;

/** 
 *  
 */
@Controller
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Resource
	private CatalogService catalogService;

	@RequestMapping("shop/viewCart")
	public String viewCart(HttpServletRequest request, ModelMap map) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		map.put("cart", cart);
		return "cart/Cart.jsp";
	}

	@RequestMapping("shop/addItemToCart")
	public String addItemToCart(@RequestParam String workingItemId, HttpServletRequest request, ModelMap map) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		if (cart.containsItemId(workingItemId)) {
			cart.incrementQuantityByItemId(workingItemId);
		} else {
			// isInStock is a "real-time" property that must be updated
			// every time an item is added to the cart, even if other
			// item details are cached.
			boolean isInStock = catalogService.isItemInStock(workingItemId);
			Item item = catalogService.getItem(workingItemId);
			cart.addItem(item, isInStock);
		}
		map.put("cart", cart);

		return "cart/Cart.jsp";
	}

	@RequestMapping("shop/removeItemFromCart")
	public String removeItemFromCart(@RequestParam String workingItemId, HttpServletRequest request, ModelMap map) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		Item item = cart.removeItemById(workingItemId);
		if (item == null) {
			logger.error("Attempted to remove null CartItem from Cart.");
		}
		return "cart/Cart.jsp";
	}

	@RequestMapping("shop/updateCartQuantities")
	public String updateCartQuantities(HttpServletRequest request, ModelMap map) {
		@SuppressWarnings("unchecked")
		Map<String, String[]> parameterMap = request.getParameterMap();
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		Iterator<CartItem> cartItems = cart.getAllCartItems();
		while (cartItems.hasNext()) {
			CartItem cartItem = (CartItem) cartItems.next();
			String itemId = cartItem.getItem().getItemId();
			try {
				String[] values = parameterMap.get(itemId);
				if (values != null) {
					int quantity = Integer.parseInt(values[0]);
					cart.setQuantityByItemId(itemId, quantity);
					if (quantity < 1) {
						cartItems.remove();
					}
				}
			} catch (Exception e) {
				// ignore parse exceptions on purpose
			}
		}

		return "cart/Cart.jsp";
	}
	
	
	@RequestMapping("shop/checkout")
	public String checkout(HttpServletRequest request, ModelMap map) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		map.put("cart", cart);
		return "cart/Checkout.jsp";
	}
}
