package com.feuji.employeeservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.feuji.employeeservice.entity.UserLoginEntity;

public interface UserLoginRepo extends JpaRepository<UserLoginEntity, Integer>{
	
	UserLoginEntity findByUserEmail(String userEmail);

}
