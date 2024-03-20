package com.feuji.accountservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.feuji.accountservice.entity.AccountEntity;

public interface AccountRepository extends JpaRepository<AccountEntity, Integer> {
	AccountEntity findByAccountName( String accountName);
	AccountEntity findByuuId( String uuId);
}
