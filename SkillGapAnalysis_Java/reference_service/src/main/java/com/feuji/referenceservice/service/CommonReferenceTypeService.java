package com.feuji.referenceservice.service;

import com.feuji.referenceservice.bean.CommonReferenceTypeBean;
import com.feuji.referenceservice.entity.CommonReferenceTypeEntity;

public interface CommonReferenceTypeService {
	
	public CommonReferenceTypeEntity getByTypeName(String typeName);
	
	public CommonReferenceTypeEntity saveTimesheetWeek(CommonReferenceTypeBean commonReferenceTypeBean);

}
