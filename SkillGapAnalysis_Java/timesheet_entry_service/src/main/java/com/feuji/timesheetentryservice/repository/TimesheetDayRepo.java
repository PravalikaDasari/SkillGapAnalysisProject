package com.feuji.timesheetentryservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.feuji.timesheetentryservice.entity.TimesheetDayEntity;

public interface TimesheetDayRepo  extends JpaRepository<TimesheetDayEntity, Long>{

}
