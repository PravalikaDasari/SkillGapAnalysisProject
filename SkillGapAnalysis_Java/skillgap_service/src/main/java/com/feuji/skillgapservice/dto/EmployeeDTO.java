package com.feuji.skillgapservice.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class EmployeeDTO {
	private String employeeName;
	private Integer employeeId;
	private String employeeCode;
	private String designition;
	private String email;
	private int skillId;
	private String skillName;
	private String actualCompetency;
	private String expectedCompetency;
	private String skillType;
	private Integer competencyDifference;
}