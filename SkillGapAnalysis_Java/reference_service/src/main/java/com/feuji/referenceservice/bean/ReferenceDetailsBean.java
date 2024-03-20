package com.feuji.referenceservice.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReferenceDetailsBean {

	private Integer referenceDetailId;

	private String referenceDetailValue;

	private ReferenceTypeBean referenceTypeId;

	private String uuid;

	private Boolean isDeleted;

	private String createdBy;

	private Timestamp createdOn;

	private String modifiedBy;

	private Timestamp modifiedOn;

}
