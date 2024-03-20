package com.feuji.timesheetentryservice.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import com.fasterxml.jackson.annotation.JsonFormat;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Entity
@Table(name = "holiday")
public class HolidayEntity {
	@Id
	@Column(name = "holiday_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long holidayId;
	@Column(name = "holiday_date")
	private LocalDateTime holidayDate;
	@Column(name = "holiday_day")
	private String holidayDay;
	@Column(name = "holiday_name")
	private String holidayName;
	@Column(name = "description")
	private String description;
	@Column(name = "location")
	private String location;
	@Column(name = "is_deleted")
	private boolean isDeleted;
	@Column(name = "uuid")
	private String uuid;
	@Column(name = "created_by")
	private String createdBy;
	@Column(name = "created_on")
	private LocalDateTime createdOn;
	@Column(name = "modified_by")
	private String modifiedBy;
	@Column(name = "modified_on")
	private LocalDateTime modifiedOn;

}
