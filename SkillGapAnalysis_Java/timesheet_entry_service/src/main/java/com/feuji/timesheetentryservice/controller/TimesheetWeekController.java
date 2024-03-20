package com.feuji.timesheetentryservice.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.feuji.timesheetentryservice.bean.TimesheetWeekBean;
import com.feuji.timesheetentryservice.dto.ProjectNameTaskDto;
import com.feuji.timesheetentryservice.entity.TimesheetWeekEntity;
import com.feuji.timesheetentryservice.repository.TimesheetWeekRepo;
import com.feuji.timesheetentryservice.service.TimesheetWeekService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/timesheet")
@CrossOrigin(origins = "http://localhost:4200")
public class TimesheetWeekController {
	private static Logger log = LoggerFactory.getLogger(TimesheetWeekController.class);

	@Autowired
	TimesheetWeekService timesheetWeekService;
	@Autowired
	TimesheetWeekRepo timesheetWeekRepo;

	@PostMapping("/save")
	public ResponseEntity<TimesheetWeekEntity> saveTimesheetWeek(@RequestBody TimesheetWeekBean timesheetWeekBean) {

		try {
			log.info("timesheet week controller", timesheetWeekBean);
			TimesheetWeekEntity timesheetWeekEntity = timesheetWeekService.save(timesheetWeekBean);
			return new ResponseEntity<>(timesheetWeekEntity, HttpStatus.CREATED);

		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}
	}
	
	@GetMapping("/gettimesheetweek/{id}")
	public ResponseEntity<TimesheetWeekEntity> getTimesheetById(@PathVariable Long id)
	{
		try
		{
			log.info("getting timesheet",id);
			TimesheetWeekEntity timesheetWeekEntity=timesheetWeekService.getById(id);
			return new ResponseEntity<>(timesheetWeekEntity, HttpStatus.CREATED);

			
		}
		catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	@GetMapping("/getproject/{id}")
	public List<String> getProjectBYEMpId(@PathVariable Long id)
	{
		log.info("passing employee id" , id);
		List<String> projectNameByEmpId = timesheetWeekService.getProjectNameByEmpId(id);
		return projectNameByEmpId;
	}
	
	@GetMapping("/getprojectname/{empId}")
	public List<Object> getProjectIdAndNameByEmpId(@PathVariable Long empId)
	{
		log.info("passing employee id" , empId);
		List<Object> projectIdAndNameByEmpId = timesheetWeekService.getProjectIdAndNameByEmpId(empId);
		return projectIdAndNameByEmpId;
	}
	
	@GetMapping("/getprojecttaskname/{employeeId}")
	public List<ProjectNameTaskDto> getProjectANdTaskNameById(@PathVariable Long employeeId)
	{
		log.info("passing employee id" , employeeId);
		List<ProjectNameTaskDto> projectNameTaskName = timesheetWeekService.getProjectNameTaskName(employeeId);
		
		return projectNameTaskName;

	}
	
}
