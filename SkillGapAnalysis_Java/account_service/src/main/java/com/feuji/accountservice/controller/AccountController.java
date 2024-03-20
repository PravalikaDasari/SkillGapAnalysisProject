package com.feuji.accountservice.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.feuji.accountservice.bean.AccountBean;
import com.feuji.accountservice.entity.AccountEntity;
import com.feuji.accountservice.service.AccountService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/accountSave")
@CrossOrigin(origins = "http://localhost:4200")
public class AccountController {
	private static Logger log = LoggerFactory.getLogger(AccountController.class);
	@Autowired
	private AccountService accountService;

	@PostMapping("/save")
	public ResponseEntity<AccountEntity> save(@RequestBody AccountBean accountBean) {
		
		
		try {
			log.info("Saving Account  {}", accountBean);
			AccountEntity saveAccountEntity = accountService.saveAccount(accountBean);

			ResponseEntity<AccountEntity> responseEntity = new ResponseEntity<>(saveAccountEntity, HttpStatus.CREATED);
			System.out.println("Data inserted");
			return responseEntity;
		} catch (Exception e) {

			System.out.println(e.getMessage());
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@GetMapping
	public ResponseEntity<List<AccountEntity>>getAll(){
		List<AccountEntity> accountEntities=accountService.getAll();
		log.info("Fetching department_details {}", accountEntities);
		ResponseEntity<List<AccountEntity>> responseEntity = new ResponseEntity<List<AccountEntity>>(accountEntities,
				HttpStatus.OK);
		return responseEntity;
		
	}
	@GetMapping(path = "/getbyId/{id}")
	public ResponseEntity<AccountEntity> get(@PathVariable int id) {
		log.info("Fetching department_details {}", id);

		AccountEntity accountEntities = accountService.findById(id);

		ResponseEntity<AccountEntity> responseEntity = new ResponseEntity<>(accountEntities,
				HttpStatus.OK);
		return responseEntity;
	}
	
	@GetMapping(path = "/getbyuuid/{uuId}")
	public ResponseEntity<AccountEntity>findByUUId(@PathVariable  String uuId) {
		log.info("Fetching department_details {}",uuId );

		AccountEntity accountEntities = accountService.findByUUId(uuId);

		ResponseEntity<AccountEntity> responseEntity = new ResponseEntity<>(accountEntities,
				HttpStatus.OK);
		return responseEntity;
	}
}

