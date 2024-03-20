package com.feuji.timesheetentryservice.repository;

import java.util.List;
import java.util.Map;

import org.hibernate.transform.ResultTransformer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.feuji.timesheetentryservice.dto.ProjectNameTaskDto;
import com.feuji.timesheetentryservice.entity.TimesheetWeekEntity;

import jakarta.persistence.NamedNativeQuery;

public interface TimesheetWeekRepo extends JpaRepository<TimesheetWeekEntity, Long> {
		@Query(value="select account_project_id  "
				+ "from account_resource_mapping Where employee_id=?",nativeQuery = true)
		public List<String> getProjectsByEmpId(Long id);
		
		
		@Query(value="select  rmap.account_project_id ,tsktp.project_name\r\n"
				+ "from account_resource_mapping rmap left join account_projects tsktp on( rmap.account_project_id=tsktp.account_project_id)\r\n"
				+ "where rmap.employee_id=?",nativeQuery = true)
		public List<Object> getProjectIdAndNameByEmpId(Long id);
		
		
	
		
	   
//	    @Query(value = "SELECT rmap.account_project_id AS accountProjectId, acp.project_name AS accountProjectName, " +
//	                   "ttype.task_id AS taskTypeId, ttype.task AS taskTypeName " +
//	                   "FROM account_projects acp " +
//	                   "LEFT JOIN account_resource_mapping rmap ON acp.account_project_id = rmap.account_project_id " +
//	                   "LEFT JOIN account_project_tasktype tsktp ON rmap.account_project_id = tsktp.account_project_id " +
//	                   "LEFT JOIN account_project_task ttype ON tsktp.tasktype_id = ttype.tasktype_id " +
//	                   "WHERE rmap.employee_id = :employeeId",
//	           nativeQuery = true)
//		public List<ProjectNameTaskDto> getProjectNameTaskName(@Param("employeeId")Long employeeId);	
		
		/*
		 * Query select rmap.account_project_id
		 * ,tsktp.account_project_id,tsktp.task_type,tsktp.tasktype_id,ttype.tasktype_id
		 * ,ttype.task_id,ttype.task from account_resource_mapping rmap left join
		 * account_project_tasktype tsktp on
		 * (rmap.account_project_id=tsktp.account_project_id) left join
		 * account_project_task ttype on (tsktp.tasktype_id=ttype.tasktype_id) where
		 * rmap.employee_id=108;
		 */
	    @Query( "SELECT new com.feuji.timesheetentryservice.ProjectNameTaskDto( rmap.accountProjectId, acp.accountProjectName, " +
                "ttype.taskTypeId, ttype.taskTypeName " +
                "FROM account_projects acp " +
                "LEFT JOIN account_resource_mapping rmap ON acp.account_project_id = rmap.account_project_id " +
                "LEFT JOIN account_project_tasktype tsktp ON rmap.account_project_id = tsktp.account_project_id " +
                "LEFT JOIN account_project_task ttype ON tsktp.tasktype_id = ttype.tasktype_id " +
                "WHERE rmap.employee_id :employeeId")
	public List<ProjectNameTaskDto> getProjectNameTaskName(@Param("employeeId")Long employeeId);	
		

}
 