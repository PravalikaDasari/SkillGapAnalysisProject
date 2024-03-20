package com.feuji.timesheetentryservice.serviceimpl;

import java.util.ArrayList;
import java.util.Iterator;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.modelmapper.ModelMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.timesheetentryservice.bean.TimesheetWeekBean;
import com.feuji.timesheetentryservice.dto.ProjectNameTaskDto;
import com.feuji.timesheetentryservice.entity.TimesheetWeekEntity;
import com.feuji.timesheetentryservice.exception.WeekNotFoundException;
import com.feuji.timesheetentryservice.repository.TimesheetWeekRepo;
import com.feuji.timesheetentryservice.service.TimesheetWeekService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TimesheetWeekServiceImpl implements TimesheetWeekService {
	private static Logger log = LoggerFactory.getLogger(TimesheetWeekServiceImpl.class);

	@Autowired
	TimesheetWeekRepo timesheetWeekRepo;
	@Autowired
	ModelMapper modelMapper;

	@Override
	public TimesheetWeekEntity save(TimesheetWeekBean timesheetWeekBean) {

		TimesheetWeekEntity timesheetWeekEntity = modelMapper.map(timesheetWeekBean, TimesheetWeekEntity.class);
		log.info("saving timesheet entity " + timesheetWeekEntity);
		timesheetWeekEntity = timesheetWeekRepo.save(timesheetWeekEntity);
		return timesheetWeekEntity;

	}

	@Override
	public TimesheetWeekEntity getById(Long id) {
		try {
			Optional<TimesheetWeekEntity> optionalWeekTimesheet = timesheetWeekRepo.findById(id);
			if (optionalWeekTimesheet.isPresent()) {
				return optionalWeekTimesheet.get();

			} else {
				throw new WeekNotFoundException("week with id not found");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.error("Week not found: {}", e.getMessage());
			return null;
		}
	}

	@Override
	public List<String> getProjectNameByEmpId(Long id) {

		try {
			log.info("projects with emp id :",id);
			List<String> projectsOfEmployee = timesheetWeekRepo.getProjectsByEmpId(id);
			return projectsOfEmployee;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
	}

	@Override
	public List<Object> getProjectIdAndNameByEmpId(Long id) {
		try {
			log.info("projects with emp id :",id);
			List<Object> projectIdAndNameByEmpId = timesheetWeekRepo.getProjectIdAndNameByEmpId(id);
			log.info("project :",projectIdAndNameByEmpId);
			return projectIdAndNameByEmpId;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
	}

	@Override
	public List<ProjectNameTaskDto> getProjectNameTaskName(Long employeeId) {
		
		
		List<ProjectNameTaskDto> projectNameTaskName = timesheetWeekRepo.getProjectNameTaskName(employeeId);
		//Custom
		
		
		
		//Custum
		
		
		return projectNameTaskName;
	}

}
