package com.feuji.timesheetentryservice.serviceimpl;

import com.feuji.timesheetentryservice.service.HolidayService;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.timesheetentryservice.controller.HolidayController;
import com.feuji.timesheetentryservice.entity.HolidayEntity;
import com.feuji.timesheetentryservice.exception.HolidayNotFoundException;
import com.feuji.timesheetentryservice.repository.HolidayRepository;
import com.feuji.timesheetentryservice.service.HolidayService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class HolidayServiceImpl implements HolidayService {
	private static Logger log = LoggerFactory.getLogger(HolidayController.class);
	@Autowired
	private HolidayRepository holidayRepository;

	@Override
	public void save(HolidayEntity holidayEntity) {
		holidayRepository.save(holidayEntity);
		log.info("Holiday details are save", holidayEntity);

	}

	@Override
	public List<HolidayEntity> getAll() {

		return holidayRepository.findAll();
	}

	@Override
	public HolidayEntity get(Long holidayId) {

		return holidayRepository.findById(holidayId).get();
	}

	@Override
	public void update(HolidayEntity holidayEntity) throws HolidayNotFoundException {
		Optional<HolidayEntity> optional = holidayRepository.findById(holidayEntity.getHolidayId());
		if (optional.isPresent()) {
			holidayRepository.save(holidayEntity);
			System.out.println("update successfull");

		} else {
			throw new HolidayNotFoundException("HolidayNotFoundExceptionbyholidayId-" + holidayEntity.getHolidayId());
		}
	}

	@Override
	public HolidayEntity delete(Long holidayId) {
		Optional<HolidayEntity> optional = holidayRepository.findById(holidayId);
		if (optional.isPresent()) {
			holidayRepository.deleteById(holidayId);

			System.out.println("deleted successfull");
		} else {
			optional.orElseThrow();
		}
		return null;

	}

}
