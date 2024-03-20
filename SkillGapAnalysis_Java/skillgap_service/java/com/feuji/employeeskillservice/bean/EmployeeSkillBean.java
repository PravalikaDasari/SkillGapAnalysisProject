package com.feuji.employeeskillservice.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeSkillBean 
{
	private Long employeeSkillId;
	private Long employeeId;
	private String employeeCode;
	private int skillId;
	private int competencyLevelId;
	private int skillTypeId;
	private int yearsOfExp;
	private byte certification;
	private String description;
	private String comments;	
	private byte isDeleted;
	private String uuid;
	private String createdBy;
	private Timestamp createdOn;
	private String modifiedBy;
	private Timestamp modifiedOn;
}
