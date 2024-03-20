package com.feuji.accountprojectservice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.feuji.accountprojectservice.bean.AccountBean;
import com.feuji.accountprojectservice.bean.AccountProjectsBean;
import com.feuji.accountprojectservice.bean.EmployeeBean;
import com.feuji.accountprojectservice.entity.AccountProjectsEntity;
import com.feuji.accountprojectservice.exception.UUIDNotFoundException;
import com.feuji.accountprojectservice.repository.AccountProjectsRepo;
import com.feuji.accountprojectservice.service.AccountProjectsService;


import lombok.extern.slf4j.Slf4j;
@CrossOrigin(origins = "http://localhost:4200")
@Slf4j
@RestController
@RequestMapping("/accountProjects")
public class AccountProjectsController {
	private static Logger log = LoggerFactory.getLogger(AccountProjectsController.class);

	@Autowired
	AccountProjectsService accountProjectsService;
	
	@Autowired
	AccountProjectsRepo accountProjectsRepo;

	@PostMapping("/save")
	public ResponseEntity<AccountProjectsEntity> save(@RequestBody AccountProjectsBean accountProjectsBean) {
		try {
			log.info("Saving project started: {}", accountProjectsBean);
			AccountProjectsEntity saveAccountProjects= accountProjectsService.save(accountProjectsBean);
			return new ResponseEntity<AccountProjectsEntity>(saveAccountProjects, HttpStatus.CREATED);
		} catch (Exception e) {
			log.error("Error occurred while saving employee: {}", e.getMessage());
			return new ResponseEntity<AccountProjectsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
//	@GetMapping("/getAccountProject/{id}")
//	public ResponseEntity<AccountProjectsEntity> getAccountProject(@PathVariable String id) {
//		try {
//			log.info("getting account project day", id);
//			AccountProjectsEntity accountProjectsEntity = accountProjectsService.getAccountProject(id);
//			return new ResponseEntity<>(accountProjectsEntity, HttpStatus.CREATED);
//
//		} catch (Exception e) {
//			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//
//	}
	

	@GetMapping(path = "/getByUuid/{uuid}")
	public ResponseEntity<AccountProjectsBean> getByUUID(@PathVariable String uuid){
	{
		log.info("Entered into getbyuuid controller");
		AccountProjectsBean bean=null;
		try {
			log.info("entered into fingbyuuid service");
		bean = accountProjectsService.findByUuid(uuid);
		log.info("coming out of  fingbyuuid service");
		return new ResponseEntity<AccountProjectsBean>(bean,HttpStatus.FOUND);
		}
		catch(Exception e)
		{
			log.error("Error occurred while saving employee: {}", e.getMessage());
			return new ResponseEntity<AccountProjectsBean>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		
	}
	}
	}
	@PutMapping("/updateAccountProject")
	public ResponseEntity<AccountProjectsBean> updateAccountProject(@RequestBody AccountProjectsBean accountProjectsBean) {
	    log.info("updateAccountProject in controller start");
	    log.info("accountProjectsBean object: {}", accountProjectsBean);
	    
	    try {
	        AccountProjectsBean updateAccountProject = accountProjectsService.updateAccountProject(accountProjectsBean);
	        log.info("updateAccountProject in controller end");
	        return new ResponseEntity<AccountProjectsBean>(updateAccountProject, HttpStatus.OK);
	    } catch (IllegalArgumentException e) {
	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    } catch (UUIDNotFoundException e) {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    } 
	}

//	@PutMapping("/updateAccountProject")
//	public ResponseEntity<AccountProjectsBean> updateAccountProject(@RequestBody AccountProjectsBean accountProjectsBean) {
//	    log.info("updateAccountProject in controller start");
//	    log.info("accountProjectsBean object: {}", accountProjectsBean);
//	    
//	    try {
//	        // Call the service method to update the account project
//	        AccountProjectsBean updatedProject = accountProjectsService.updateAccountProject(accountProjectsBean);
//	        
//	        log.info("updateAccountProject in controller end");
//	        return new ResponseEntity<>(updatedProject, HttpStatus.OK);
//	    } catch (IllegalArgumentException e) {
//	        // Handle case where the request body is null or invalid
//	        log.error("Invalid request: {}", e.getMessage());
//	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//	    } catch (UUIDNotFoundException e) {
//	        // Handle case where the project UUID is not found
//	        log.error("Project not found: {}", e.getMessage());
//	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//	    }
//	}
	
	@GetMapping(path = "/getAll")
    public ResponseEntity<List<AccountProjectsBean>> getAllAccountProjects() {
        List<AccountProjectsBean> accountProjects = accountProjectsService.getAllAccountProjects();
        return new ResponseEntity<>(accountProjects, HttpStatus.OK);
    }
	
	
	@GetMapping(path="/getaccount")
	public ResponseEntity<List<AccountBean>> getAccount() {
	    List<AccountBean> beans = accountProjectsService.getAccountBean();
	    return new ResponseEntity<>(beans, HttpStatus.OK);
	}
	

	@GetMapping(path="/getEmployee")
	public ResponseEntity<List<EmployeeBean>> getAllEmployees() {
	    List<EmployeeBean> beans = accountProjectsService.getEmployeeBean();
	    return new ResponseEntity<>(beans, HttpStatus.OK);
	}



	
}

