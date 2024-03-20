package com.feuji.timesheetentryservice.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.feuji.timesheetentryservice.entity.HolidayEntity;

public interface HolidayRepository extends JpaRepository<HolidayEntity, Long> {

}
