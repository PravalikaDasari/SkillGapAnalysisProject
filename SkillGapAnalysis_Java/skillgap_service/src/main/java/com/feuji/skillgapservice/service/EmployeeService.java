package com.feuji.skillgapservice.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.feuji.skillgapservice.dto.EmployeeEntityDto;

public interface EmployeeService {
	public Page<EmployeeEntityDto> findEmployeeBySkillID(int[] skillId,Pageable pageable);
}
