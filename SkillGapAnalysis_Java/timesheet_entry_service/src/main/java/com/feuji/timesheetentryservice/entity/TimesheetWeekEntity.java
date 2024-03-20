package com.feuji.timesheetentryservice.entity;

import java.sql.Timestamp;

import javax.management.ConstructorParameters;

import org.hibernate.annotations.GeneratorType;
import org.springframework.stereotype.Service;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name="project_week_timesheet")
public class TimesheetWeekEntity {
@Id
@Column(name="timesheet_week_id")
@GeneratedValue(strategy = GenerationType.AUTO)
	private Long timesheetWeekId;
@Column(name="account_id")
	private Long accountId;
@Column(name="project_id")
	private Long	projectId;
	@Column(name="employee_id")
	private Long	employeeId;
	@Column(name="week_number")
		private Long weekNumber;
	@Column(name="week_start_date")
		private Timestamp weekStartDate;
	@Column(name="week_end_date")
		private Timestamp weekEndDate;
	@Column(name="comments")
		private String comments;
		@Column(name="timesheet_status")
	private int	timesheetStatus;
		@Column(name="approved_by")
	private int 	approvedBy;
		@Column(name="is_active")
	private Boolean isactive;
		@Column(name="is_deleted")
	private Boolean isDeleted;
		@Column(name="uuid")
		private String uuid;
		@Column(name="created_by")
		private String createdBy;
		@Column(name="created_on")
		private Timestamp createdOn;
		@Column(name="modified_by")
		private String modifiedBy;
		@Column(name="modified_on")
		private Timestamp modifiedOn;
}
