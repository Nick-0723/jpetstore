/**
 * @Date 2016年1月30日 上午11:02:00
 * @author tangq
 * @version V1.0
 * 
 */
package com.ibatis.jpetstore.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibatis.jpetstore.domain.Account;
import com.ibatis.jpetstore.domain.Cart;
import com.ibatis.jpetstore.domain.Order;
import com.ibatis.jpetstore.service.AccountService;
import com.ibatis.jpetstore.service.OrderService;

/** 
 *  
 */
@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	private static final List<String> CARD_TYPE_LIST;

	static {
		List<String> cardList = new ArrayList<String>();
		cardList.add("Visa");
		cardList.add("MasterCard");
		cardList.add("American Express");
		CARD_TYPE_LIST = Collections.unmodifiableList(cardList);
	}

	@Resource
	private AccountService accountService;
	
	@Resource
	private OrderService orderService;

	@RequestMapping("shop/newOrderForm")
	public String newOrderForm(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
		Cart cart = (Cart) session.getAttribute("cart");

		if (account == null) {
			map.put("message",
					"You must sign on before attempting to check out.  Please sign on and try checking out again.");
			return "account/SignonForm.jsp";
		} else if (cart != null) {
			Order order = new Order();
			order.initOrder(account, cart);
			session.setAttribute("order", order);
			map.put("order", order);
			map.put("creditCardTypes", CARD_TYPE_LIST);
			return "order/NewOrderForm.jsp";
		} else {
			map.put("message", "An order could not be created because a cart could not be found.");
			return "common/Error.jsp";
		}
	}

	@RequestMapping("shop/newOrderDispatch")
	public String newOrderDispatch(Order order, String source, boolean shippingAddressRequired,
			HttpServletRequest request, ModelMap map) {
		Order orderInSession = (Order) request.getSession().getAttribute("order");
		if (shippingAddressRequired) {
			orderInSession.updateByForm(order, "halfDone");
			return "order/ShippingForm.jsp";
		} else {
			if("shipping".equals(source)){
				orderInSession.updateByForm(order, "shipping");
			}else{
				orderInSession.updateByForm(order, null);
			}
			return "forward:/shop/confirm.shtml";
		} 
	}

	@RequestMapping("shop/confirm")
	public String newOrderConfirm(HttpServletRequest request, ModelMap map) {
		Order orderInSession = (Order) request.getSession().getAttribute("order");
		map.put("order", orderInSession);
		return "order/ConfirmOrder.jsp";
	}

	@RequestMapping("shop/newOrder")
	public String newOrder(HttpServletRequest request, ModelMap map) {
		Order order = (Order) request.getSession().getAttribute("order");
		orderService.insertOrder(order);
		map.put("order", order);
		return "order/ViewOrder.jsp";
	}

}
