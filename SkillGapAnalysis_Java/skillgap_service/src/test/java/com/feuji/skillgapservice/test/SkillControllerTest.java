//package com.feuji.skillgapservice.test;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertNotNull;
//import static org.junit.jupiter.api.Assertions.assertTrue;
//import static org.mockito.ArgumentMatchers.any;
//import static org.mockito.Mockito.doReturn;
//import static org.mockito.Mockito.doThrow;
//import static org.mockito.Mockito.never;
//import static org.mockito.Mockito.times;
//import static org.mockito.Mockito.verify;
//import static org.mockito.Mockito.when;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//
//import com.feuji.skillgapservice.bean.SkillBean;
//import com.feuji.skillgapservice.controller.SkillController;
//import com.feuji.skillgapservice.dto.SkillNamesDto;
//import com.feuji.skillgapservice.exception.RecordNotFoundException;
//import com.feuji.skillgapservice.exception.SkillNotFoundException;
//import com.feuji.skillgapservice.service.SkillService;
//
//public class SkillControllerTest {
//
//	@InjectMocks
//	private SkillController skillController;
//
//	@Mock
//	private SkillService skillService;
//
//	@BeforeEach
//	public void setUp() {
//		MockitoAnnotations.openMocks(this);
//	}
//
//	/**
//	 * Tests the successful saving of a SkillBean record. Verifies that the
//	 * controller returns the saved SkillBean object with an HTTP status of CREATED.
//	 */
//	@Test
//	public void testSaveSkill_Success() {
//		SkillBean skillBean = new SkillBean();
//		skillBean.setSkillName("Java");
//
//		doReturn(skillBean).when(skillService).saveSkill(skillBean);
//
//		ResponseEntity<SkillBean> responseEntity = skillController.saveSkill(skillBean);
//
//		assertEquals(skillBean, responseEntity.getBody());
//		assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
//		verify(skillService, times(1)).saveSkill(skillBean);
//	}
//
//	/**
//	 * Tests the scenario when a NullPointerException is thrown while saving a
//	 * SkillBean record. Verifies that the controller returns an HTTP status of
//	 * NOT_FOUND.
//	 */
//	@Test
//	public void testSaveSkill_NullPointerException() {
//		SkillBean skillBean = null;
//
//		doThrow(NullPointerException.class).when(skillService).saveSkill(skillBean);
//
//		ResponseEntity<SkillBean> responseEntity = skillController.saveSkill(skillBean);
//
//		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
//		verify(skillService, times(1)).saveSkill(skillBean);
//	}
//
//	/**
//	 * Tests the scenario when a SkillNotFoundException is thrown while saving a
//	 * SkillBean record. Verifies that the controller returns an HTTP status of
//	 * NOT_FOUND.
//	 */
//	@Test
//	public void testSaveSkill_SkillNotFoundException() {
//		SkillBean skillBean = new SkillBean();
//		skillBean.setSkillName("Java");
//
//		doThrow(SkillNotFoundException.class).when(skillService).saveSkill(skillBean);
//
//		ResponseEntity<SkillBean> responseEntity = skillController.saveSkill(skillBean);
//
//		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
//		verify(skillService, times(1)).saveSkill(skillBean);
//	}
//
//	/**
//	 * Tests the successful scenario for updating SkillBean details. Verifies that
//	 * the controller returns the updated SkillBean object and HTTP status OK.
//	 */
//	@Test
//	public void testUpdateSkillDetails_Success() {
//		String uuid = "1234-5678-9101";
//		SkillBean skillBean = new SkillBean();
//		skillBean.setSkillName("Java");
//
//		when(skillService.updateSkillDetails(skillBean)).thenReturn(skillBean);
//
//		ResponseEntity<SkillBean> responseEntity = skillController.updateSkillDetails(uuid, skillBean);
//
//		assertEquals(skillBean, responseEntity.getBody());
//		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
//		verify(skillService, times(1)).updateSkillDetails(skillBean);
//	}
//
//	/**
//	 * Tests the scenario where a SkillNotFoundException is thrown during the update
//	 * of SkillBean details. Verifies that the controller returns HTTP status
//	 * NOT_MODIFIED.
//	 */
//	@Test
//	public void testUpdateSkillDetails_SkillNotFoundException() {
//		String uuid = "1234-5678-9101";
//		SkillBean skillBean = new SkillBean();
//		skillBean.setSkillName("Java");
//
//		when(skillService.updateSkillDetails(skillBean)).thenThrow(new SkillNotFoundException("Exception"));
//
//		ResponseEntity<SkillBean> responseEntity = skillController.updateSkillDetails(uuid, skillBean);
//
//		assertEquals(HttpStatus.NOT_MODIFIED, responseEntity.getStatusCode());
//		verify(skillService, times(1)).updateSkillDetails(skillBean);
//	}
//
//	/**
//	 * Tests the scenario where a NullPointerException is thrown during the update
//	 * of SkillBean details. Verifies that the controller returns HTTP status
//	 * NOT_MODIFIED.
//	 */
//	@Test
//	public void testUpdateSkillDetails_NullPointerException() {
//		String uuid = "1234-5678-9101";
//		SkillBean skillBean = null;
//
//		ResponseEntity<SkillBean> responseEntity = skillController.updateSkillDetails(uuid, skillBean);
//
//		assertEquals(HttpStatus.NOT_MODIFIED, responseEntity.getStatusCode());
//		verify(skillService, never()).updateSkillDetails(any());
//	}
//
//	/**
//	 * Tests the successful retrieval of skills by technical category ID. Verifies
//	 * that the controller returns a list of SkillBean objects and HTTP status OK.
//	 */
//	@Test
//	public void testGetSkillsByTechCategoryId_Success() {
//		int categoryId = 1;
//		List<SkillBean> skillList = new ArrayList<>();
//		skillList.add(
//				new SkillBean(categoryId, "Java", categoryId, categoryId, null, null, null, null, null, null, null));
//		skillList.add(
//				new SkillBean(categoryId, "Python", categoryId, categoryId, null, null, null, null, null, null, null));
//
//		when(skillService.getSkillsByTechCategoryId(categoryId)).thenReturn(skillList);
//
//		ResponseEntity<List<SkillBean>> responseEntity = skillController.getSkillsByTechCategoryId(categoryId);
//
//		assertEquals(skillList, responseEntity.getBody());
//		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
//		verify(skillService, times(1)).getSkillsByTechCategoryId(categoryId);
//	}
//
//	/**
//	 * Tests the case where no skills are found for the provided technical category
//	 * ID. Verifies that the controller returns HTTP status NOT_FOUND.
//	 */
//	@Test
//	public void testGetSkillsByTechCategoryId_SkillNotFoundException() {
//		int categoryId = 1;
//
//		when(skillService.getSkillsByTechCategoryId(categoryId)).thenThrow(new SkillNotFoundException("Exceptioon"));
//
//		ResponseEntity<List<SkillBean>> responseEntity = skillController.getSkillsByTechCategoryId(categoryId);
//
//		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
//		verify(skillService, times(1)).getSkillsByTechCategoryId(categoryId);
//	}
//
//	/**
//	 * Tests the successful retrieval of a SkillBean record by its ID. Verifies that
//	 * the controller returns the SkillBean object and HTTP status FOUND.
//	 */
//	@Test
//	public void testGetSkillBySkillId_Success() {
//		int skillId = 1;
//		SkillBean skillBean = new SkillBean(skillId, "Java", skillId, skillId, null, null, null, null, null, null,
//				null);
//
//		when(skillService.getSkillBySkillId(skillId)).thenReturn(skillBean);
//
//		ResponseEntity<SkillBean> responseEntity = skillController.getSkillBySkillId(skillId);
//
//		assertEquals(skillBean, responseEntity.getBody());
//		assertEquals(HttpStatus.FOUND, responseEntity.getStatusCode());
//		verify(skillService, times(1)).getSkillBySkillId(skillId);
//	}
//
//	/**
//	 * Tests the scenario when the SkillNotFoundException is thrown while retrieving
//	 * a SkillBean record by its ID. Verifies that the controller returns HTTP
//	 * status NOT_FOUND.
//	 */
//	@Test
//	public void testGetSkillBySkillId_SkillNotFoundException() {
//		int skillId = 1;
//
//		when(skillService.getSkillBySkillId(skillId)).thenThrow(new SkillNotFoundException("Exception"));
//
//		ResponseEntity<SkillBean> responseEntity = skillController.getSkillBySkillId(skillId);
//
//		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
//		verify(skillService, times(1)).getSkillBySkillId(skillId);
//	}
//
//	/**
//	 * Tests the successful retrieval of SkillNamesDto objects by an array of skill
//	 * IDs. Verifies that the controller returns HTTP status OK and the correct list
//	 * of SkillNamesDto objects.
//	 */
//	@Test
//	public void testGetSkillNamesBySkillId_Success() {
//		int[] skillIds = { 1, 2, 3 };
//		List<SkillNamesDto> skills = Arrays.asList(new SkillNamesDto(1, "Java"), new SkillNamesDto(2, "Python"),
//				new SkillNamesDto(3, "JavaScript"));
//
//		try {
//			when(skillService.getSkillNamesBySkillId(skillIds)).thenReturn(skills);
//		} catch (RecordNotFoundException e) {
//			e.printStackTrace();
//		}
//
//		ResponseEntity<List<SkillNamesDto>> responseEntity = skillController.getSkillNamesBySkillId(skillIds);
//
//		assertEquals(skills, responseEntity.getBody());
//		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
//		try {
//			verify(skillService, times(1)).getSkillNamesBySkillId(skillIds);
//		} catch (RecordNotFoundException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * Tests the scenario where the service throws a RecordNotFoundException when
//	 * retrieving SkillNamesDto objects by an array of skill IDs. Verifies that the
//	 * controller returns HTTP status NOT_FOUND and an empty list.
//	 */
//	@Test
//	public void testGetSkillNamesBySkillId_RecordNotFoundException() {
//		int[] skillIds = { 4, 5, 6 };
//
//		try {
//			when(skillService.getSkillNamesBySkillId(skillIds))
//					.thenThrow(new RecordNotFoundException("Skills not found"));
//		} catch (RecordNotFoundException e) {
//			e.printStackTrace();
//		}
//
//		ResponseEntity<List<SkillNamesDto>> responseEntity = skillController.getSkillNamesBySkillId(skillIds);
//
//		assertNotNull(responseEntity.getBody());
//		assertTrue(responseEntity.getBody().isEmpty());
//		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
//		try {
//			verify(skillService, times(1)).getSkillNamesBySkillId(skillIds);
//		} catch (RecordNotFoundException e) {
//			e.printStackTrace();
//		}
//	}
//
//}
