package com.feuji.skillgapservice.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.feuji.skillgapservice.bean.SkillCompetencyBean;
import com.feuji.skillgapservice.controller.SkillCompetencyController;
import com.feuji.skillgapservice.dto.PaginationDto;
import com.feuji.skillgapservice.exception.RecordNotFoundException;
import com.feuji.skillgapservice.service.SkillCompetencyService;

public class SkillCompetencyControllerTest {

    @InjectMocks
    private SkillCompetencyController skillCompetencyController;

    @Mock
    private SkillCompetencyService skillCompetencyService;

    public SkillCompetencyControllerTest() {
        MockitoAnnotations.openMocks(this);
    }

    /**
     * Tests the successful saving of a new SkillCompetencyBean record.
     * Verifies that the controller correctly saves the record and returns an HTTP status of CREATED.
     */
    @Test
    public void testSaveSkillCompetency_Success() {
        SkillCompetencyBean skillCompetencyBean = new SkillCompetencyBean();
        skillCompetencyBean.setRoleName("Java");

        doNothing().when(skillCompetencyService).saveSkillCompetency(skillCompetencyBean);

        ResponseEntity<String> responseEntity = skillCompetencyController.saveSkillCompetency(skillCompetencyBean);

        assertEquals("record saved successfully", responseEntity.getBody());
        assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
        verify(skillCompetencyService, times(1)).saveSkillCompetency(skillCompetencyBean);
    }

    /**
     * Tests the failure case when saving a new SkillCompetencyBean record.
     * Verifies that the controller handles the exception correctly and returns an HTTP status of NOT_FOUND.
     */
    @Test
    public void testSaveSkillCompetency_Failure() {
        SkillCompetencyBean skillCompetencyBean = new SkillCompetencyBean();
        skillCompetencyBean.setRoleName("Java");

        doThrow(NullPointerException.class).when(skillCompetencyService).saveSkillCompetency(skillCompetencyBean);

        ResponseEntity<String> responseEntity = skillCompetencyController.saveSkillCompetency(skillCompetencyBean);

        assertEquals("error occured in saving record", responseEntity.getBody());
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        verify(skillCompetencyService, times(1)).saveSkillCompetency(skillCompetencyBean);
    }
    
    
    /**
     * Tests the successful update of all SkillCompetencyBean records.
     * Verifies that the controller returns the updated SkillCompetencyBean object and an HTTP status of OK.
     */
    @Test
    public void testUpdateAllSkillCompetencyRecords_Success() {
        SkillCompetencyBean competencyBean = new SkillCompetencyBean();
        competencyBean.setRoleName("Java");
        String uuid = "1234-5678-9101";

        try {
			when(skillCompetencyService.updateAllSkillCompetencyRecords(competencyBean)).thenReturn(competencyBean);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<SkillCompetencyBean> responseEntity = skillCompetencyController.updateAllSkillCompetencyRecords(competencyBean, uuid);

        assertEquals(competencyBean, responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).updateAllSkillCompetencyRecords(competencyBean);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    
    /**
     * Tests the successful retrieval of a SkillCompetencyBean record by skill ID.
     * Verifies that the controller returns the retrieved SkillCompetencyBean object and an HTTP status of OK.
     */
    @Test
    public void testGetSkillCompetencyBySkillId_Success() {
        int skillId = 1;
        SkillCompetencyBean skillCompetencyBean = new SkillCompetencyBean();
        skillCompetencyBean.setSkillId(skillId);

        try {
			when(skillCompetencyService.getSkillCompetencyBySkillId(skillId)).thenReturn(skillCompetencyBean);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<SkillCompetencyBean> responseEntity = skillCompetencyController.getSkillCompetencyBySkillId(skillId);

        assertEquals(skillCompetencyBean, responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).getSkillCompetencyBySkillId(skillId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    /**
     * Tests the scenario where a RecordNotFoundException is thrown when retrieving a SkillCompetencyBean record by skill ID.
     * Verifies that the controller returns an HTTP status of NOT_FOUND.
     */
    @Test
    public void testGetSkillCompetencyBySkillId_RecordNotFoundException() {
        int skillId = 1;

        try {
			when(skillCompetencyService.getSkillCompetencyBySkillId(skillId)).thenThrow(new RecordNotFoundException("exception"));
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<SkillCompetencyBean> responseEntity = skillCompetencyController.getSkillCompetencyBySkillId(skillId);

        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).getSkillCompetencyBySkillId(skillId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

   
    
    /**
     * Tests the successful retrieval of roles by technical category ID.
     * Verifies that the controller returns a list of SkillCompetencyBean objects and an HTTP status of OK.
     */
    @Test
    public void testGetRolesBySkillId_Success() {
        int technicalCatId = 1;
        List<SkillCompetencyBean> beans = new ArrayList<>();
        beans.add(new SkillCompetencyBean());
        beans.add(new SkillCompetencyBean());

        try {
			doReturn(beans).when(skillCompetencyService).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<List<SkillCompetencyBean>> responseEntity = skillCompetencyController.getRolesBySkillId(technicalCatId);

        assertEquals(beans, responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    /**
     * Tests the case where no roles are found for the provided technical category ID.
     * Verifies that the controller returns an HTTP status of NOT_FOUND.
     */
    @Test
    public void testGetRolesBySkillId_RecordNotFoundException() {
        int technicalCatId = 1;

        try {
			doThrow(RecordNotFoundException.class).when(skillCompetencyService).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<List<SkillCompetencyBean>> responseEntity = skillCompetencyController.getRolesBySkillId(technicalCatId);

        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    /**
     * Tests the case where a NullPointerException is thrown when retrieving roles for a technical category ID.
     * Verifies that the controller returns an HTTP status of NOT_FOUND.
     */
    @Test
    public void testGetRolesBySkillId_NullPointerException() {
        int technicalCatId = 1;

        try {
			doThrow(NullPointerException.class).when(skillCompetencyService).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<List<SkillCompetencyBean>> responseEntity = skillCompetencyController.getRolesBySkillId(technicalCatId);

        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).findSkillCompetencyByTechId(technicalCatId);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    /**
     * Tests the successful retrieval of a paginated list of employee skills based on an array of skill IDs.
     * Verifies that the controller returns an HTTP status of OK.
     */
    @Test
    public void testFetchAllSkillIdWise_Success() {
        int[] skillId = {1, 2, 3};
        int page = 1;
        int size = 10;
        PaginationDto paginationDto = new PaginationDto();

        try {
			doReturn(paginationDto).when(skillCompetencyService).getAllEmployeeSkillsBySkillIds(skillId, page, size);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<PaginationDto> responseEntity = skillCompetencyController.fetcAllSkillIdWise(skillId, page, size);

        assertEquals(paginationDto, responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).getAllEmployeeSkillsBySkillIds(skillId, page, size);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

    
    /**
     * Tests the scenario where a RecordNotFoundException is thrown when trying to retrieve a paginated list of employee skills
     * based on an array of skill IDs.
     * Verifies that the controller returns an HTTP status of NOT_FOUND.
     */
    @Test
    public void testFetchAllSkillIdWise_RecordNotFoundException() {
        int[] skillId = {1, 2, 3};
        int page = 1;
        int size = 10;

        try {
			doThrow(RecordNotFoundException.class).when(skillCompetencyService).getAllEmployeeSkillsBySkillIds(skillId, page, size);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}

        ResponseEntity<PaginationDto> responseEntity = skillCompetencyController.fetcAllSkillIdWise(skillId, page, size);

        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        try {
			verify(skillCompetencyService, times(1)).getAllEmployeeSkillsBySkillIds(skillId, page, size);
		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		}
    }

 
    
    
}
