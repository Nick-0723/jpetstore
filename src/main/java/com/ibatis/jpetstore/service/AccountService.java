package com.ibatis.jpetstore.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibatis.jpetstore.domain.Account;
import com.ibatis.jpetstore.persistence.iface.AccountDao;

@Service
public class AccountService {

	@Resource
	private AccountDao accountDao;

	public Account getAccount(String username) {
		return accountDao.getAccount(username);
	}

	public Account getAccount(String username, String password) {
		return accountDao.getAccount(username, password);
	}

	public void insertAccount(Account account) {
		accountDao.insertAccount(account);
	}

	public void updateAccount(Account account) {
		accountDao.updateAccount(account);
	}

}
