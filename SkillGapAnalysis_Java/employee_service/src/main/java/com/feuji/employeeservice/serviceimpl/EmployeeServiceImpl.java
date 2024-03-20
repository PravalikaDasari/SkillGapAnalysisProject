package com.feuji.employeeservice.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.employeeservice.bean.EmployeeBean;
import com.feuji.employeeservice.entity.EmployeeEntity;
import com.feuji.employeeservice.exception.RecordsNotFoundException;
import com.feuji.employeeservice.repository.EmployeeRepository;
import com.feuji.employeeservice.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	public EmployeeRepository employeeRepository;

	@Override
	public EmployeeEntity saveEmployee(EmployeeBean employeeBean) {
		log.info("Service Save Method Start");
		EmployeeEntity employeeEntity = beanToEntity(employeeBean);
		if (employeeEntity != null) {
			employeeEntity = employeeRepository.save(employeeEntity);
			log.info("Service Save Method End");
			return employeeEntity;
		} else {
			throw new NullPointerException("failed to save records");
		}
	}

	@Override
	public List<EmployeeEntity> getAllEmployees() throws RecordsNotFoundException {
		log.info("Service getAllEmployees Method Start");
		List<EmployeeEntity> employees = employeeRepository.findAll();
		if (!employees.isEmpty()) {
			log.info("Service getAllEmployees Method End");
			return employees;
		} else {
			throw new RecordsNotFoundException("No records found");
		}
	}

	@Override
	public EmployeeBean findByEmail(String employeeEmail) throws RecordsNotFoundException {
		log.info("Service findByEmail Method Start");

		Optional<EmployeeEntity> optionalEntity = employeeRepository.findByEmail(employeeEmail);
		if (optionalEntity.isPresent()) {
			EmployeeEntity entity = optionalEntity.get();
			log.info("Service findByEmail Method End");
			return entityToBean(entity);
		} else {
			throw new RecordsNotFoundException("employee not found with this email :" + employeeEmail);
		}
	}

	@Override
	public EmployeeEntity getById(Integer id) throws RecordsNotFoundException {
		log.info("Service getById Method Start");
		EmployeeEntity employeeEntity = employeeRepository.findById(id)
				.orElseThrow(() -> new RecordsNotFoundException("Employee not found with id:"));
		return employeeEntity;
	}

	@Override
	public void updateEmployeeDetails(EmployeeEntity updateEmployee, Integer id) throws Throwable {
		try {
			log.info("Service updateEmployeeDetails Method Start");
			EmployeeEntity existingEmployee = employeeRepository.findById(id)
					.orElseThrow(() -> new Exception("Employee not found with id: " + id));
			existingEmployee.setFirstName(updateEmployee.getFirstName());
			existingEmployee.setMiddleName(updateEmployee.getMiddleName());
			existingEmployee.setLastName(updateEmployee.getLastName());
			existingEmployee.setDesignation(updateEmployee.getDesignation());
			existingEmployee.setEmail(updateEmployee.getEmail());
			existingEmployee.setGender(updateEmployee.getGender());
			existingEmployee.setDateOfJoining(updateEmployee.getDateOfJoining());
			existingEmployee.setReportingManagerId(updateEmployee.getReportingManagerId());
			existingEmployee.setEmploymentType(updateEmployee.getEmploymentType());
			existingEmployee.setStatus(updateEmployee.getStatus());
			existingEmployee.setDeliveryUnitId(updateEmployee.getDeliveryUnitId());
			existingEmployee.setBusinessUnitId(updateEmployee.getBusinessUnitId());
			existingEmployee.setExitDate(updateEmployee.getExitDate());
			existingEmployee.setExitRemarks(updateEmployee.getExitRemarks());
			existingEmployee.setIsDeleted(updateEmployee.getIsDeleted());
			existingEmployee.setUuid(updateEmployee.getUuid());
			existingEmployee.setCreatedBy(updateEmployee.getCreatedBy());
			existingEmployee.setCreatedOn(updateEmployee.getCreatedOn());
			existingEmployee.setModifiedBy(updateEmployee.getModifiedBy());
			existingEmployee.setModifiedOn(updateEmployee.getModifiedOn());
			employeeRepository.save(existingEmployee);
			log.info("Service updateEmployeeDetails Method End");
		} catch (Exception e) {
			throw new RecordsNotFoundException("failed to update records");
		}

	}

	public EmployeeBean entityToBean(EmployeeEntity entity) {
		EmployeeBean employeeBean = new EmployeeBean();
		employeeBean.setEmployeeId(entity.getEmployeeId());
		employeeBean.setEmployeeCode(entity.getEmployeeCode());
		employeeBean.setFirstName(entity.getFirstName());
		employeeBean.setMiddleName(entity.getMiddleName());
		employeeBean.setLastName(entity.getLastName());
		employeeBean.setDesignation(entity.getDesignation());
		employeeBean.setEmail(entity.getEmail());
		employeeBean.setGender(entity.getGender());
		employeeBean.setDateOfJoining(entity.getDateOfJoining());
		employeeBean.setReportingManagerId(entity.getReportingManagerId());
		employeeBean.setEmploymentType(entity.getEmploymentType());
		employeeBean.setStatus(entity.getStatus());
		employeeBean.setDeliveryUnitId(entity.getDeliveryUnitId());
		employeeBean.setBusinessUnitId(entity.getBusinessUnitId());
		employeeBean.setExitDate(entity.getExitDate());
		employeeBean.setExitRemarks(entity.getExitRemarks());
		employeeBean.setIsDeleted(entity.getIsDeleted());
		employeeBean.setUuid(entity.getUuid());
		employeeBean.setCreatedBy(entity.getCreatedBy());
		employeeBean.setCreatedOn(entity.getCreatedOn());
		employeeBean.setModifiedBy(entity.getModifiedBy());
		employeeBean.setModifiedOn(entity.getModifiedOn());
		return employeeBean;
	}

	public EmployeeEntity beanToEntity(EmployeeBean employeeBean) {
		EmployeeEntity entity = new EmployeeEntity();
		entity.setEmployeeId(employeeBean.getEmployeeId());
		entity.setEmployeeCode(employeeBean.getEmployeeCode());
		entity.setFirstName(employeeBean.getFirstName());
		entity.setMiddleName(employeeBean.getMiddleName());
		entity.setLastName(employeeBean.getLastName());
		entity.setDesignation(employeeBean.getDesignation());
		entity.setEmail(employeeBean.getEmail());
		entity.setGender(employeeBean.getGender());
		entity.setDateOfJoining(employeeBean.getDateOfJoining());
		entity.setReportingManagerId(employeeBean.getReportingManagerId());
		entity.setEmploymentType(employeeBean.getEmploymentType());
		entity.setStatus(employeeBean.getStatus());
		entity.setDeliveryUnitId(employeeBean.getDeliveryUnitId());
		entity.setBusinessUnitId(employeeBean.getBusinessUnitId());
		entity.setExitDate(employeeBean.getExitDate());
		entity.setExitRemarks(employeeBean.getExitRemarks());
		entity.setIsDeleted(employeeBean.getIsDeleted());
		entity.setUuid(employeeBean.getUuid());
		entity.setCreatedBy(employeeBean.getCreatedBy());
		entity.setCreatedOn(employeeBean.getCreatedOn());
		entity.setModifiedBy(employeeBean.getModifiedBy());
		entity.setModifiedOn(employeeBean.getModifiedOn());
		return entity;
	}
}
