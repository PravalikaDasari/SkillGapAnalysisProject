package com.feuji.referenceservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.feuji.referenceservice.bean.CommonReferenceTypeBean;
import com.feuji.referenceservice.entity.CommonReferenceTypeEntity;
import com.feuji.referenceservice.exception.ReferenceNotFoundException;
import com.feuji.referenceservice.service.CommonReferenceTypeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/referencetype")
public class CommonReferenceTypeController {

	@Autowired
	CommonReferenceTypeService commonReferenceTypeService;

	/**
	 * Saves a common reference type entity using the provided data. This method is
	 * used to create or update a common reference type entity based on the provided
	 * data.
	 * 
	 * @param commonReferenceTypeBean The data to be used for creating or updating
	 *                                the common reference type entity.
	 * @return ResponseEntity<CommonReferenceTypeEntity> A ResponseEntity containing
	 *         the saved common reference type entity if successful, or
	 *         HttpStatus.INTERNAL_SERVER_ERROR if an error occurs during the save
	 *         operation.
	 */
	@PostMapping("/save")
	public ResponseEntity<CommonReferenceTypeEntity> saveTimesheetWeek(
			@RequestBody CommonReferenceTypeBean commonReferenceTypeBean) {
		try {
			log.info("saveTimesheetWeek Start");
			CommonReferenceTypeEntity save = commonReferenceTypeService.saveTimesheetWeek(commonReferenceTypeBean);
			log.info("saveTimesheetWeek end");
			return new ResponseEntity<>(save, HttpStatus.CREATED);

		} catch (ReferenceNotFoundException e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}
	}

	/**
	 * Retrieves a common reference type entity by the provided type name.
	 * 
	 * This method is used to fetch a common reference type entity associated with
	 * the provided type name.
	 * 
	 * @param typeName The type name for which to retrieve a common reference type
	 *                 entity.
	 * @return ResponseEntity<CommonReferenceTypeEntity> A ResponseEntity containing
	 *         the common reference type entity if found, or null if no entity is
	 *         found for the provided type name. Returns HttpStatus.OK if a common
	 *         reference type entity is found, HttpStatus.NOT_FOUND if the provided
	 *         type name is not found.
	 * @throws ReferenceNotFoundException If the common reference type entity
	 *                                    retrieved by the provided type name is not
	 *                                    found.
	 */
	@GetMapping("/getref/{name}")
	public ResponseEntity<CommonReferenceTypeEntity> getReferenceTypeByName(@PathVariable String typeName) {
		log.info("getReferenceTypeByName start");
		CommonReferenceTypeEntity commonReferenceTypeEntity = null;
		try {
			commonReferenceTypeEntity = commonReferenceTypeService.getByTypeName(typeName);
			log.info("getReferenceTypeByName end");
			return new ResponseEntity<>(commonReferenceTypeEntity, HttpStatus.OK);
		} catch (ReferenceNotFoundException e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(commonReferenceTypeEntity, HttpStatus.NOT_FOUND);
		}

	}
}
