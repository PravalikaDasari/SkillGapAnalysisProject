package com.feuji.timesheetentryservice.service;
import java.util.List;

import com.feuji.timesheetentryservice.entity.HolidayEntity;
public interface HolidayService {
	void save(HolidayEntity holidayEntity);
	List<HolidayEntity> getAll();

	HolidayEntity get(Long holidayId);


	void update(HolidayEntity holidayEntity );
	HolidayEntity delete(Long holidayId);
}
