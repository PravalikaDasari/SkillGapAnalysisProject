package com.feuji.timesheetentryservice.service;

import com.feuji.timesheetentryservice.bean.TimesheetDayBean;

import com.feuji.timesheetentryservice.entity.TimesheetDayEntity;

public interface TimesheetDayService {
	
	public TimesheetDayEntity saveTimesheetDay(TimesheetDayBean timesheetDayBean);
	
	public TimesheetDayEntity getTimeSheetDayByuuid(Long id);

}
