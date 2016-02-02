package com.ibatis.jpetstore.persistence.sqlmapdao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.jpetstore.domain.Account;
import com.ibatis.jpetstore.persistence.iface.AccountDao;

@Repository
public class AccountSqlMapDao implements AccountDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public Account getAccount(String username) {
		return sqlSessionTemplate.selectOne("Account.getAccountByUsername", username);
	}

	public Account getAccount(String username, String password) {
		Account account = new Account();
		account.setUsername(username);
		account.setPassword(password);
		return sqlSessionTemplate.selectOne("Account.getAccountByUsernameAndPassword", account);
	}

	public void insertAccount(Account account) {
		sqlSessionTemplate.insert("Account.insertAccount", account);
		sqlSessionTemplate.insert("Account.insertProfile", account);
		sqlSessionTemplate.insert("Account.insertSignon", account);
	}

	public void updateAccount(Account account) {
		sqlSessionTemplate.update("Account.updateAccount", account);
		sqlSessionTemplate.update("Account.updateProfile", account);

		if (account.getPassword() != null && account.getPassword().length() > 0) {
			sqlSessionTemplate.update("Account.updateSignon", account);
		}
	}

}
