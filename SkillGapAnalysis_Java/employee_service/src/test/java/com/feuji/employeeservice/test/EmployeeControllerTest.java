package com.feuji.employeeservice.test;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.feuji.employeeservice.bean.EmployeeBean;
import com.feuji.employeeservice.controller.EmployeeController;
import com.feuji.employeeservice.entity.EmployeeEntity;
import com.feuji.employeeservice.exception.RecordsNotFoundException;
import com.feuji.employeeservice.service.EmployeeService;


public class EmployeeControllerTest {

	@Mock
	private EmployeeService employeeService;

	@InjectMocks
	private EmployeeController employeeController;

	private EmployeeEntity employeeEntity;
	private EmployeeBean employeeBean;

	/**
	 * Sets up the Mockito environment before each test case.
	 * Initializes mock objects and defines their behavior.
	 * Mocks the EmployeeService to return mocked data or throw exceptions as needed.
	 * Configures behavior for saving an employee, retrieving all employees,
	 * and finding an employee by email. Throws a RecordsNotFoundException
	 * when attempting to find an employee with a non-existent email.
	 */
	@BeforeEach
	public void setUp() {
	    MockitoAnnotations.openMocks(this);
	    employeeEntity = new EmployeeEntity();
	    employeeEntity.setEmployeeId(1);
	    employeeBean = new EmployeeBean();
	    employeeBean.setEmployeeId(1);
	    try {
	        when(employeeService.saveEmployee(any(EmployeeBean.class))).thenReturn(employeeEntity);
	        List<EmployeeEntity> employeeEntities = new ArrayList<>();
	        employeeEntities.add(employeeEntity);
	        when(employeeService.getAllEmployees()).thenReturn(employeeEntities);
	        when(employeeService.findByEmail("john.doe@example.com")).thenReturn(employeeBean);
	        doThrow(new RecordsNotFoundException("Employee not found with email: nonexistent@example.com"))
	                .when(employeeService).findByEmail("nonexistent@example.com");
	    } catch (RecordsNotFoundException e) {
	        e.printStackTrace(); 
	    }
	}


	/**
	 * Tests the functionality of saving an employee by calling the saveEmployee method
	 * of the EmployeeController.
	 * Verifies that the controller returns an HTTP status of OK and the expected
	 * EmployeeEntity object in the response body.
	 */
	@Test
	public void testSaveEmployee() {
		ResponseEntity<EmployeeEntity> response = employeeController.saveEmployee(new EmployeeBean());

		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertEquals(employeeEntity, response.getBody());
	}

	/**
	 * Tests the functionality of retrieving all employees by calling the getAllEmployees
	 * method of the EmployeeController.
	 * Verifies that the controller returns an HTTP status of OK, a list of employees
	 * in the response body, and that the list contains the expected employee entity.
	 */
	@Test
	public void testGetAllEmployees() {
		ResponseEntity<List<EmployeeEntity>> response = null;
		try {
			response = employeeController.getAllEmployees();
		} catch (RecordsNotFoundException e) {
			fail("RecordsNotFoundException was not expected: " + e.getMessage());
			e.printStackTrace();
		}
		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertEquals(1, response.getBody().size());
		assertEquals(employeeEntity, response.getBody().get(0));
	}

	/**
	 * Tests the functionality of retrieving an employee by email address by calling
	 * the getByEmail method of the EmployeeController with a valid email address.
	 * Verifies that the controller returns an HTTP status of OK and the correct employee
	 * bean in the response body.
	 */
	@Test
	public void testGetByEmail_Success() {
		ResponseEntity<EmployeeBean> response = employeeController.getByEmail("john.doe@example.com");

		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertEquals(employeeBean, response.getBody());
	}

	/**
	 * Tests the functionality of retrieving an employee by email address by calling
	 * the getByEmail method of the EmployeeController with a non-existing email address.
	 * Verifies that the controller returns an HTTP status of NOT_FOUND since the email
	 * does not correspond to any employee record, and the response body is null.
	 */
	@Test
	public void testGetByEmail_RecordNotFound() {
		ResponseEntity<EmployeeBean> response = employeeController.getByEmail("nonexistent@example.com");

		assertEquals(HttpStatus.NOT_FOUND, response.getStatusCode());
		assertEquals(null, response.getBody());
	}
}
