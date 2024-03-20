package com.feuji.timesheetentryservice.service;

import java.util.List;
import java.util.Map;

import com.feuji.timesheetentryservice.bean.TimesheetWeekBean;
import com.feuji.timesheetentryservice.dto.ProjectNameTaskDto;
import com.feuji.timesheetentryservice.entity.TimesheetWeekEntity;

public interface TimesheetWeekService {
	
	public TimesheetWeekEntity save(TimesheetWeekBean timesheetWeekBean);

	public TimesheetWeekEntity getById(Long id);
	
	public List<String>getProjectNameByEmpId(Long id);
	
	public List<Object> getProjectIdAndNameByEmpId(Long id);
	
	public List<ProjectNameTaskDto> getProjectNameTaskName(Long id);


}
