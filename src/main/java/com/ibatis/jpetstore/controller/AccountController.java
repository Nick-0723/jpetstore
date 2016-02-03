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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibatis.jpetstore.domain.Account;
import com.ibatis.jpetstore.service.AccountService;
import com.ibatis.jpetstore.service.CatalogService;

/** 
 *  
 */
@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	private static final List<String> LANGUAGE_LIST;
	private static final List<String> CATEGORY_LIST;

	static {
		List<String> langList = new ArrayList<String>();
		langList.add("english");
		langList.add("japanese");
		LANGUAGE_LIST = Collections.unmodifiableList(langList);

		List<String> catList = new ArrayList<String>();
		catList.add("FISH");
		catList.add("DOGS");
		catList.add("REPTILES");
		catList.add("CATS");
		catList.add("BIRDS");
		CATEGORY_LIST = Collections.unmodifiableList(catList);
	}

	@Resource
	private CatalogService catalogService;

	@Resource
	private AccountService accountService;

	@RequestMapping("shop/newAccountForm")
	public String newAccountForm(HttpServletRequest request, ModelMap map) {
		map.put("languages", LANGUAGE_LIST);
		map.put("categories", CATEGORY_LIST);
		return "account/NewAccountForm.jsp";
	}

	@RequestMapping("shop/newAccount")
	public String newAccount(Account account, HttpServletRequest request, ModelMap map) {
		accountService.insertAccount(account);
		request.getSession().setAttribute("account", account);
		request.getSession().setAttribute("myList", catalogService.getProductListByCategory(account.getFavouriteCategoryId()));
		return "redirect:/shop/index.shtml";
	}

	@RequestMapping("shop/editAccountForm")
	public String editAccountForm(HttpServletRequest request, ModelMap map) {
		map.put("languages", LANGUAGE_LIST);
		map.put("categories", CATEGORY_LIST);
		map.put("account", request.getSession().getAttribute("account"));
		return "account/EditAccountForm.jsp";
	}

	@RequestMapping("shop/editAccount")
	public String editAccount(Account account, HttpServletRequest request, ModelMap map) {
		Account accountSession = (Account) request.getSession().getAttribute("account");
		account.setUsername(accountSession.getUsername());
		accountService.updateAccount(account);
		return "redirect:/shop/index.shtml";
	}

	@RequestMapping("shop/signon")
	public String signon(@RequestParam(value="username") String username, @RequestParam(value="password") String password,  HttpServletRequest request, ModelMap map) {
		Account account = accountService.getAccount(username, password);
		if (account == null) {
			String value = "Invalid username or password.  Signon failed.";
			map.put("message", value);
			return "account/SignonForm.jsp";
		} else {
			account.setPassword(null);
			request.getSession().setAttribute("account", account);
			request.getSession().setAttribute("myList", catalogService.getProductListByCategory(account.getFavouriteCategoryId()));
			return "redirect:/shop/index.shtml";
		}
	}

	@RequestMapping("shop/signoff")
	public String signoff(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/shop/index.shtml";
	}
	
	@RequestMapping("shop/signonForm")
	public String signonForm(HttpServletRequest request, ModelMap map) {
		return "account/SignonForm.jsp";
	}


}
