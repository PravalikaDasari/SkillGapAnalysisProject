package com.feuji.timesheetentryservice.bean;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class TimesheetWeekBean {

	private int timesheetWeekId;
	private int accountId;
	private int projectId;
	private int employeeId;
	private int weekNumber;
	private Timestamp weekStartDate;
	private Timestamp weekEndDate;
	private String comments;

	private int timesheetStatus;
	private int approvedBy;
	private Boolean isactive;
	private Boolean isDeleted;
	private String uuid;

	private String createdBy;
	private Timestamp createdOn;
	private String modifiedBy;

	private Timestamp modifiedOn;
}
