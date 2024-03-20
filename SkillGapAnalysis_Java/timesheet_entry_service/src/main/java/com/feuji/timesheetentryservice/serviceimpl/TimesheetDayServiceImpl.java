package com.feuji.timesheetentryservice.serviceimpl;

import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.timesheetentryservice.bean.TimesheetDayBean;

import com.feuji.timesheetentryservice.entity.TimesheetDayEntity;
import com.feuji.timesheetentryservice.entity.TimesheetWeekEntity;
import com.feuji.timesheetentryservice.exception.WeekNotFoundException;
import com.feuji.timesheetentryservice.repository.TimesheetDayRepo;
import com.feuji.timesheetentryservice.service.TimesheetDayService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service

public class TimesheetDayServiceImpl implements TimesheetDayService {
	private static Logger log = LoggerFactory.getLogger(TimesheetDayServiceImpl.class);
	@Autowired
	ModelMapper modelMapper;
	@Autowired
	TimesheetDayRepo timesheetDayRepo;
	
	@Override
	public TimesheetDayEntity saveTimesheetDay(TimesheetDayBean timesheetDayBean) {
		log.info("bean from frontend",timesheetDayBean);
		TimesheetDayEntity timesheetDayEntity=modelMapper.map(timesheetDayBean, TimesheetDayEntity.class);
		timesheetDayEntity = timesheetDayRepo.save(timesheetDayEntity);
		log.info("bean from frontend",timesheetDayEntity);
		return timesheetDayEntity;
	}

	@Override
	public TimesheetDayEntity getTimeSheetDayByuuid(Long id) {
		try {
	  Optional<TimesheetDayEntity> optionalDayTimesheet = timesheetDayRepo.findById(id);
			if (optionalDayTimesheet.isPresent()) {
				return optionalDayTimesheet.get();

			} else {
				throw new WeekNotFoundException("week with id not found");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			log.error("Day not found: {}", e.getMessage());
			return null;
		}
	}

}
