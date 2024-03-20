package com.feuji.referenceservice.service;

import java.util.List;

import javax.naming.NameNotFoundException;

import com.feuji.referenceservice.bean.CommonReferenceDetailsBean;
import com.feuji.referenceservice.bean.TechnicalSkillsBean;
import com.feuji.referenceservice.exception.CategoryNotFoundException;
import com.feuji.referenceservice.exception.ReferenceNotFoundException;
import com.feuji.referenceservice.exception.TechnicalSkillsNotFoundException;

import jakarta.persistence.EntityNotFoundException;

public interface CommonReferenceDetailsService {
	public List<TechnicalSkillsBean> getDetailsByTypeId(String typeName) throws TechnicalSkillsNotFoundException;

	public int getIdByName(String name) throws NameNotFoundException;

	public List<String> getCategories(String category) throws CategoryNotFoundException;

	

//	public List<CommonReferenceDetailsBean> getSubSkillCategory() throws EntityNotFoundException;
	
	public void saveReferenceDetails(CommonReferenceDetailsBean referenceDetailsBean);

	public void addSubSkillcategory(CommonReferenceDetailsBean bean) throws ReferenceNotFoundException;
	public List<String> getSubSkillCategory() throws EntityNotFoundException;

	public String getByid(int id);
}
//	
