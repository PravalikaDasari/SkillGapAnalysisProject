package com.feuji.timesheetentryservice.entity;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Entity
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name="project_day_timesheet")
public class TimesheetDayEntity {
	  @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "timesheet_day_id")
	    private Long timesheetDayId;
	  	@OneToOne
	  	@JoinColumn(name="timesheet_week_id",referencedColumnName = "timesheet_week_id")
	
	    private TimesheetWeekEntity timesheetWeekEntity;

	    @Column(name = "attendance_type")
	    private Long attendanceType;

	    @Column(name = "task_id")
	    private Long taskId;

	    @Column(name = "date")
	    private Timestamp date;

	    @Column(name = "no_of_hours")
	    private Double numberOfHours;

	    @Column(name = "is_active")
	    private Boolean isActive;

	    @Column(name = "isdeleted")
	    private Boolean isDeleted;

	    @Column(name = "uuid")
	    private String uuid;

	    @Column(name = "created_by")
	    private String createdBy;

	    @Column(name = "created_on")
	    private Timestamp createdOn;

	    @Column(name = "modified_by")
	    private String modifiedBy;

	    @Column(name = "modified_on")
	    private Timestamp modifiedOn;

}
