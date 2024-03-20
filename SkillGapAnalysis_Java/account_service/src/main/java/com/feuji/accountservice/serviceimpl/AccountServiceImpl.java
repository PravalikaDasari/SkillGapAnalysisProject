package com.feuji.accountservice.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.accountservice.bean.AccountBean;
import com.feuji.accountservice.entity.AccountEntity;
import com.feuji.accountservice.exception.SaveUniqueAccountException;
import com.feuji.accountservice.repository.AccountRepository;
import com.feuji.accountservice.service.AccountService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public AccountEntity saveAccount(AccountBean accountBean) throws SaveUniqueAccountException {
		
		AccountEntity accountEntity1 = beanToEntity(accountBean);
		log.info("Save the data"+accountEntity1);
		AccountEntity	accountEntity2= accountRepository.findByAccountName(accountEntity1.getAccountName());
		if (accountEntity2 == null) {
			accountRepository.save(accountEntity1);
			System.out.println(" Account Details Type details saved { " + accountEntity1 + " }");
			return accountEntity1;
		} else {
			throw new SaveUniqueAccountException("Account Name already Exist");
		}


	}
	@Override
	public AccountEntity updateAccount(AccountBean accountBean) {
		AccountEntity accountEntity1 = beanToEntity(accountBean);
		return accountRepository.save(accountEntity1);
	}

	@Override
	public List<AccountEntity> getAll() {
		return accountRepository.findAll();
	}


	@Override
	public AccountEntity beanToEntity(AccountBean accountBean) {
		AccountEntity entity = new AccountEntity();
		entity.setAccountId(accountBean.getAccountId());
		entity.setAccountName(accountBean.getAccountName());
		entity.setOwnerId(accountBean.getOwnerId());
		entity.setRelationshipManagerId(accountBean.getRelationshipManagerId());
		entity.setBusinessDevelopmentManagerId(accountBean.getBusinessDevelopmentManagerId());
		entity.setParentAccountId(accountBean.getParentAccountId());
		entity.setAccountBuId(accountBean.getAccountBuId());
		entity.setPlannedStartDate(accountBean.getPlannedStartDate());
		entity.setPlannedEndDate(accountBean.getPlannedEndDate());
		entity.setActualStartDate(accountBean.getActualStartDate());
		entity.setActualEndDate(accountBean.getActualEndDate());
		entity.setAddress(accountBean.getAddress());
		entity.setCity(accountBean.getCity());
		entity.setState(accountBean.getState());
		entity.setZipcode(accountBean.getZipcode());
		entity.setCountry(accountBean.getCountry());
		entity.setIsRed(accountBean.getIsRed());
		entity.setAccountStatus(accountBean.getAccountStatus());
		entity.setComments(accountBean.getComments());
		entity.setIsDeleted(accountBean.getIsDeleted());
		entity.setUuId(accountBean.getUuId());
		entity.setCreatedBy(accountBean.getCreatedBy());
		entity.setCreatedOn(accountBean.getCreatedOn());
		entity.setModifiedBy(accountBean.getModifiedBy());
		entity.setModifiedOn(accountBean.getModifiedOn());
		return entity;
	}
	@Override
	public AccountEntity findById(int id) {
		
      return accountRepository.findById(id).get();
	}
	@Override
	public AccountEntity findByUUId(String uuId) {
		
		return accountRepository.findByuuId(uuId);
	}
	
	
}
