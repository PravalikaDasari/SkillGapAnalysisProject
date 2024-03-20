package com.feuji.accountprojectservice.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.feuji.accountprojectservice.entity.AccountProjectsEntity;

public interface AccountProjectsRepo extends JpaRepository<AccountProjectsEntity,Integer>{
	
	//AccountProjectsEntity findaccountProjectByUuid(String uuid);
	
	Optional<AccountProjectsEntity> findByUuid(String uuid);

}
