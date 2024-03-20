package com.feuji.skillgapservice.dto;

import java.util.List;

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
public class EmployeeListDTO {
	private List<String> employeeName;
	private List<Integer> employeeId;
	private List<Integer> skillId;
	private List<String> skillName;
	private List<Integer> employeeCompetencyLevel;
}
