package com.feuji.accountservice.service;

import java.util.List;

import com.feuji.accountservice.bean.AccountBean;
import com.feuji.accountservice.entity.AccountEntity;
import com.feuji.accountservice.exception.SaveUniqueAccountException;

public interface AccountService {
	
	AccountEntity saveAccount(AccountBean accountBean) throws SaveUniqueAccountException ;
	
	AccountEntity beanToEntity(AccountBean accountBean);
	
	AccountEntity updateAccount(AccountBean accountBean);
	
	List<AccountEntity> getAll();
	
	AccountEntity findById(int id);
	
	AccountEntity findByUUId( String uuId);
}
