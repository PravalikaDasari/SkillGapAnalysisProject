package com.feuji.employeeskillservice.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
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

import com.feuji.employeeskillservice.bean.EmployeeSkillBean;
import com.feuji.employeeskillservice.bean.EmployeeSkillGet;
import com.feuji.employeeskillservice.bean.EmployeeUiBean;
import com.feuji.employeeskillservice.controller.EmployeeSkillController;
import com.feuji.employeeskillservice.exception.InvalidInputException;
import com.feuji.employeeskillservice.exception.NoRecordFoundException;
import com.feuji.employeeskillservice.service.EmployeeSkillService;

public class EmployeeSkillControllerTest {

	@Mock
	private EmployeeSkillService employeeSkillService;

	@InjectMocks
	private EmployeeSkillController employeeSkillController;

	/**
	 * Setup method annotated with {@code @BeforeEach} to initialize mock objects
	 * for each test method. This method is executed before each test method in the
	 * test class.
	 */
	@BeforeEach
	public void setup() {
		MockitoAnnotations.openMocks(this);
	}

	/**
	 * Test case for successfully saving a list of EmployeeSkillBeans through the
	 * EmployeeSkillController.
	 *
	 * @throws IllegalArgumentException If an invalid argument is provided.
	 * @throws NoRecordFoundException   If no records are found.
	 */
	@Test
	public void testSaveEmployeeSkillBean_Success() throws IllegalArgumentException, NoRecordFoundException {
		List<EmployeeUiBean> employeeUiBeans = new ArrayList<>();
		List<EmployeeSkillBean> savedEmployeeSkillBeansList = new ArrayList<>();

		when(employeeSkillService.convertUiBeanToSkillBean(employeeUiBeans)).thenReturn(savedEmployeeSkillBeansList);
		when(employeeSkillService.saveAll(savedEmployeeSkillBeansList)).thenReturn(savedEmployeeSkillBeansList);

		ResponseEntity<List<EmployeeSkillBean>> responseEntity = employeeSkillController
				.saveEmployeeSkillBean(employeeUiBeans);

		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		assertEquals(savedEmployeeSkillBeansList, responseEntity.getBody());
	}

	/**
	 * Test method to verify the failure scenario when attempting to save employee
	 * skill records. This test ensures that the controller appropriately handles
	 * exceptions and propagates the expected failure.
	 *
	 * @throws IllegalArgumentException if the conversion of UI beans to skill beans
	 *                                  fails.
	 * @throws NoRecordFoundException   if no records are found during the
	 *                                  operation.
	 */
	@Test
	public void testSaveEmployeeSkillBean_Failure() throws IllegalArgumentException, NoRecordFoundException {
		List<EmployeeUiBean> employeeUiBeans = new ArrayList<>();

		when(employeeSkillService.convertUiBeanToSkillBean(employeeUiBeans))
				.thenThrow(new IllegalArgumentException("failed to save records"));

		assertThrows(IllegalArgumentException.class,
				() -> employeeSkillController.saveEmployeeSkillBean(employeeUiBeans));
	}

	/**
	 * Test method to verify the successful update of an employee skill. This test
	 * ensures that the controller updates the employee skill using the provided
	 * data, and the response contains the updated employee skill information.
	 *
	 * @throws Exception if an unexpected error occurs during the update operation.
	 */
	@Test
	public void testUpdateEmployeeSkill_Success() throws Exception {
		Long employeeSkillId = 1L;
		EmployeeSkillGet set = new EmployeeSkillGet();
		EmployeeSkillBean updatedEmployeeSkillBean = new EmployeeSkillBean();

		when(employeeSkillService.updateEmployeeSkill(set, employeeSkillId)).thenReturn(updatedEmployeeSkillBean);

		ResponseEntity<EmployeeSkillBean> responseEntity = employeeSkillController.updateEmployeeSkill(set,
				employeeSkillId);

		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		assertEquals(updatedEmployeeSkillBean, responseEntity.getBody());
	}

	/**
	 * Test case to verify the successful deletion of an employee skill record
	 * through the {@link EmployeeSkillController#deleteEmployeeSkill(Long)} method.
	 *
	 * <p>
	 * The test uses Mockito to mock the {@link EmployeeSkillService} and simulates
	 * the successful deletion scenario. It ensures that the controller returns a
	 * {@link ResponseEntity} with HTTP status OK and the expected result message
	 * after successfully deleting the employee skill record.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs during the test execution.
	 */
	@Test
	public void testDeleteEmployeeSkill_Success() throws Exception {
		Long employeeSkillId = 1L;
		String result = "Successfully deleted";

		when(employeeSkillService.updateDeleteStatus(employeeSkillId)).thenReturn(result);

		ResponseEntity<String> responseEntity = employeeSkillController.deleteEmployeeSkill(employeeSkillId);

		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		assertEquals(result, responseEntity.getBody());

		verify(employeeSkillService, times(1)).updateDeleteStatus(employeeSkillId);
	}

	/**
	 * Test case to verify the behavior of the
	 * {@link EmployeeSkillController#deleteEmployeeSkill(Long)} method when the
	 * underlying service operation throws an {@link InvalidInputException}.
	 *
	 * <p>
	 * The test uses Mockito to mock the {@link EmployeeSkillService} and simulates
	 * the scenario where the service method throws an
	 * {@link InvalidInputException}. It ensures that the controller returns a
	 * {@link ResponseEntity} with HTTP status BAD_REQUEST and no response body
	 * (assuming error messages are not exposed in the response body for security
	 * reasons) after encountering the exception.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs during the test execution.
	 */
	@Test
	public void testDeleteEmployeeSkill_InvalidInputException_ReturnsBadRequest() throws Exception {
		Long employeeSkillId = 1L;
		String errorMessage = "Invalid input";

		when(employeeSkillService.updateDeleteStatus(employeeSkillId))
				.thenThrow(new InvalidInputException(errorMessage));

		ResponseEntity<String> responseEntity = employeeSkillController.deleteEmployeeSkill(employeeSkillId);

		assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
		assertNull(responseEntity.getBody()); 
		verify(employeeSkillService, times(1)).updateDeleteStatus(employeeSkillId);
	}

	/**
	 * Test case to verify the behavior of the
	 * {@link EmployeeSkillController#deleteEmployeeSkill(Long)} method when the
	 * underlying service operation throws a {@link RuntimeException}.
	 *
	 * <p>
	 * The test uses Mockito to mock the {@link EmployeeSkillService} and simulates
	 * the scenario where the service method throws a {@link RuntimeException}. It
	 * ensures that the controller propagates the exception and does not catch it,
	 * resulting in an assertion failure. The expected behavior is that the method
	 * throws a {@link RuntimeException} during execution.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs during the test execution.
	 */
	@Test
	public void testDeleteEmployeeSkill_Exception_ReturnsBadRequest() throws Exception {
		Long employeeSkillId = 1L;

		when(employeeSkillService.updateDeleteStatus(employeeSkillId))
				.thenThrow(new RuntimeException("Test exception"));

		assertThrows(RuntimeException.class, () -> {
			employeeSkillController.deleteEmployeeSkill(employeeSkillId);
		});

		verify(employeeSkillService, times(1)).updateDeleteStatus(employeeSkillId);
	}

	/**
	 * Test case to verify the successful behavior of the
	 * {@link EmployeeSkillController#getAllEmployeeSkills(String)} method when the
	 * underlying service operation retrieves employee skills successfully.
	 *
	 * <p>
	 * The test uses Mockito to mock the {@link EmployeeSkillService} and simulates
	 * the scenario where the service method retrieves employee skills successfully.
	 * It ensures that the controller returns a response entity with HTTP status OK
	 * and the expected list of employee skills.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs during the test execution.
	 */
	@Test
	public void testGetAllEmployeeSkills_Success() throws Exception {
		String email = "test@example.com";
		List<EmployeeSkillGet> allEmployeeSkills = new ArrayList<>();
		when(employeeSkillService.getAllEmployeeSkills(email)).thenReturn(allEmployeeSkills);

		ResponseEntity<List<EmployeeSkillGet>> responseEntity = employeeSkillController.getAllEmployeeSkills(email);

		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		assertEquals(allEmployeeSkills, responseEntity.getBody());

	}

	/**
	 * Test case to verify the failure scenario of fetching all employee skills
	 * using the {@link EmployeeSkillController#getAllEmployeeSkills(String)}
	 * method.
	 *
	 * <p>
	 * The test uses Mockito to mock the {@link EmployeeSkillService} and simulates
	 * the scenario where the service method throws an exception. It ensures that
	 * the controller returns a {@link ResponseEntity} with HTTP status NOT_FOUND,
	 * indicating the failure to retrieve employee skills.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs during the test execution.
	 */
	@Test
	public void testGetAllEmployeeSkills_Failure_ReturnsNotFound() throws Exception {
		String email = "test@example.com";
		when(employeeSkillService.getAllEmployeeSkills(email)).thenThrow(new Exception("Test exception"));

		ResponseEntity<List<EmployeeSkillGet>> responseEntity = employeeSkillController.getAllEmployeeSkills(email);

		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
	}

	/**
	 * Test case for successfully retrieving employee skill beans by skill ID
	 * through the EmployeeSkillController.
	 *
	 * @throws Exception If an unexpected error occurs during the test.
	 */
	@Test
	public void testGetBySkillId_Success() throws Exception {
		int skillId = 1;
		List<EmployeeSkillBean> employeeSkillBeanList = new ArrayList<>();
		when(employeeSkillService.findBySkillId(skillId)).thenReturn(employeeSkillBeanList);

		ResponseEntity<List<EmployeeSkillBean>> responseEntity = employeeSkillController.getBySkillId(skillId);

		assertEquals(HttpStatus.FOUND, responseEntity.getStatusCode());
		assertEquals(employeeSkillBeanList, responseEntity.getBody());

		verify(employeeSkillService, times(1)).findBySkillId(skillId);
	}

	/**
	 * Test case for handling the failure scenario when retrieving employee skill
	 * beans by skill ID through the EmployeeSkillController, and it returns HTTP
	 * status NOT_FOUND.
	 *
	 * @throws Exception If an unexpected error occurs during the test.
	 */
	@Test
	public void testGetBySkillId_Failure_ReturnsNotFound() throws Exception {
		int skillId = 1;
		when(employeeSkillService.findBySkillId(skillId)).thenThrow(new NoRecordFoundException("Test exception"));

		ResponseEntity<List<EmployeeSkillBean>> responseEntity = employeeSkillController.getBySkillId(skillId);

		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());

		verify(employeeSkillService, times(1)).findBySkillId(skillId);
	}

	/**
	 * Test case for handling the failure scenario when retrieving employee skill
	 * beans by skill ID through the EmployeeSkillController, and it returns HTTP
	 * status NOT_FOUND due to an invalid input.
	 *
	 * @throws Exception If an unexpected error occurs during the test.
	 */
	@Test
	public void testGetBySkillId_Failure_InvalidInput_ReturnsNotFound() throws Exception {
		int skillId = 1;
		when(employeeSkillService.findBySkillId(skillId)).thenThrow(new InvalidInputException("Test exception"));

		ResponseEntity<List<EmployeeSkillBean>> responseEntity = employeeSkillController.getBySkillId(skillId);

		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());

		verify(employeeSkillService, times(1)).findBySkillId(skillId);
	}

	/**
	 * Test case for successfully retrieving employee skill beans by employee ID
	 * through the EmployeeSkillController, and it returns HTTP status OK.
	 *
	 * @throws NoRecordFoundException If no records are found during the operation.
	 */
	@Test
	public void testGetEmployeeSkillById_Success() throws NoRecordFoundException {
		Long employeeId = 1L;
		List<EmployeeSkillBean> employeeSkillBeanList = new ArrayList<>();
		when(employeeSkillService.getEmployeeSkillById(employeeId)).thenReturn(employeeSkillBeanList);

		ResponseEntity<List<EmployeeSkillBean>> responseEntity = employeeSkillController
				.getEmployeeSkillById(employeeId);

		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		assertEquals(employeeSkillBeanList, responseEntity.getBody());

		verify(employeeSkillService).getEmployeeSkillById(employeeId);
	}

}
