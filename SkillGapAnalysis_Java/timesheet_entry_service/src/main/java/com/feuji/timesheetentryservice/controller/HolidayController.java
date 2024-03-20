package com.feuji.timesheetentryservice.controller;
import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.feuji.timesheetentryservice.entity.HolidayEntity;
import com.feuji.timesheetentryservice.exception.HolidayNotFoundException;
import com.feuji.timesheetentryservice.exception.HolidayNotFoundException;
import com.feuji.timesheetentryservice.service.HolidayService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@RestController
@RequestMapping("/holiday")
@CrossOrigin()
public class HolidayController {
	private static Logger log = LoggerFactory.getLogger(HolidayController.class);
	@Autowired
	private HolidayService holidayService;
	
	
//	public LocalDate
//	fromDateToLocalDate(Date date) {
//		return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
//	}
	
	
	
	
	@PostMapping
	public ResponseEntity<HolidayEntity> save(@RequestBody HolidayEntity holidayEntity) {
		log.info("Saving holiday details {}",holidayEntity );
		holidayService.save(holidayEntity);

		ResponseEntity<HolidayEntity> responseEntity = new ResponseEntity<>(holidayEntity, HttpStatus.CREATED);
		return responseEntity;


}
	@GetMapping(path = "/{holidayId}")
	public ResponseEntity<HolidayEntity> get(@PathVariable Long holidayId) {
		log.info("Fetching department_details {}", holidayId);

		HolidayEntity holidayEntity = holidayService.get(holidayId);

		ResponseEntity<HolidayEntity> responseEntity = new ResponseEntity<>(holidayEntity,
				HttpStatus.OK);
		return responseEntity;
	}
	
	@GetMapping
	public ResponseEntity<List<HolidayEntity>>getAll(){
		List<HolidayEntity>holidayEntity=holidayService.getAll();
		log.info("Fetching department_details {}", holidayEntity);
		ResponseEntity<List<HolidayEntity>> responseEntity = new ResponseEntity<List<HolidayEntity>>(holidayEntity,
				HttpStatus.OK);
		return responseEntity;
		
	}
	
	@PutMapping
	public ResponseEntity<String> handlePutRequestupdate(@RequestBody HolidayEntity holidayEntity){
		log.info("start the holiday_details Controller:update");
		try {
			holidayService.update(holidayEntity);
			log.info("Update holiday_details {}", holidayEntity);
			  return new ResponseEntity<String>("Updating the holiday with id"+holidayEntity,HttpStatus.OK);
					
			
		}catch(HolidayNotFoundException e) {
			System.out.println(e.getMessage());
			log.info("handing Exception in holidaycontroller::update{}");
			 return new ResponseEntity<String>(e.getMessage(),HttpStatus.NOT_FOUND);
		}

}
	
	@DeleteMapping(path = "/{holidayId}")
	public ResponseEntity<HolidayEntity>delate(@PathVariable Long holidayId){
		HolidayEntity holidayEntity	=holidayService.delete(holidayId);
		log.info("Delete department_details {}", holidayId);
		ResponseEntity<HolidayEntity>responseEntity = new ResponseEntity<HolidayEntity>(holidayEntity,
				HttpStatus.OK);
		return responseEntity;
		
	}
}


