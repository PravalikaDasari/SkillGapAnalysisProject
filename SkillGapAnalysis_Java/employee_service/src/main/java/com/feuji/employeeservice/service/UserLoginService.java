package com.feuji.employeeservice.service;

import com.feuji.employeeservice.entity.UserLoginEntity;

public interface UserLoginService {

	public UserLoginEntity loginUser(String userEmail, String userPassword);

}
