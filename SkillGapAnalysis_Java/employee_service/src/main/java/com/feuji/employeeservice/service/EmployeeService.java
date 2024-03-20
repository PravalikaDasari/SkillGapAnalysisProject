package com.feuji.employeeservice.service;

import java.util.List;

import com.feuji.employeeservice.bean.EmployeeBean;
import com.feuji.employeeservice.entity.EmployeeEntity;
import com.feuji.employeeservice.exception.RecordsNotFoundException;

public interface EmployeeService {

	public EmployeeEntity saveEmployee(EmployeeBean employeeBean);

	public EmployeeEntity getById(Integer Id) throws RecordsNotFoundException;

	public List<EmployeeEntity> getAllEmployees() throws RecordsNotFoundException;

	public void updateEmployeeDetails(EmployeeEntity updateEmpolyee, Integer id) throws Throwable;

	public EmployeeBean findByEmail(String email) throws RecordsNotFoundException;
}
