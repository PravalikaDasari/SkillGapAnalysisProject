package com.feuji.referenceservice.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.referenceservice.bean.CommonReferenceDetailsBean;
import com.feuji.referenceservice.bean.TechnicalSkillsBean;
import com.feuji.referenceservice.constants.CommonConstants;
import com.feuji.referenceservice.entity.CommonReferenceDetailsEntity;
import com.feuji.referenceservice.entity.CommonReferenceTypeEntity;
import com.feuji.referenceservice.exception.CategoryNotFoundException;
import com.feuji.referenceservice.exception.RecordAlreadyExistsException;
import com.feuji.referenceservice.exception.ReferenceNotFoundException;
import com.feuji.referenceservice.exception.TechnicalSkillsNotFoundException;
import com.feuji.referenceservice.repository.CommonReferenceDetailsRepo;
import com.feuji.referenceservice.repository.CommonReferenceTypeRepo;
import com.feuji.referenceservice.service.CommonReferenceDetailsService;

import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommonReferenceDetailsImpl implements CommonReferenceDetailsService {

	@Autowired
	CommonReferenceDetailsRepo commonReferenceDetailsRepo;
	@Autowired
	CommonReferenceTypeRepo commonReferenceTypeRepo;
	
	/*
	 * Converts a {@link CommonReferenceDetailsBean} to a
	 * {@link CommonReferenceDetailsEntity}.
	 * 
	 * @param bean The {@link CommonReferenceDetailsBean} to be converted.
	 * @return The converted {@link CommonReferenceDetailsEntity}.
	 */
	public CommonReferenceDetailsEntity convertBeanToEntity(CommonReferenceDetailsBean bean)
	{
		System.out.println(bean);
		CommonReferenceTypeEntity commonReferenceTypeEntity = new CommonReferenceTypeEntity();
		commonReferenceTypeEntity.setReferenceTypeId(bean.getReferenceType().getReferenceTypeId());
		CommonReferenceDetailsEntity entity=new CommonReferenceDetailsEntity();
		entity.setReferenceDetailId(bean.getReferenceDetailId());
		entity.setReferenceDetailValue(bean.getReferenceDetailValue());
		entity.setReferenceType(commonReferenceTypeEntity);
		entity.setIsDeleted(bean.getIsDeleted());
		entity.setModifiedBy(bean.getModifiedBy());
		entity.setCreatedBy(bean.getCreatedBy());
		return entity;
	}
	@Override
	public List<TechnicalSkillsBean> getDetailsByTypeId(String typeName) {
		log.info("getDetailsByTypeId start");
		List<String> detailsByTypeName = commonReferenceDetailsRepo.getDetailsByTypeName(typeName);
		if (detailsByTypeName != null) {
			List<TechnicalSkillsBean> list = new ArrayList<>();
			for (String item : detailsByTypeName) {
				TechnicalSkillsBean bean = new TechnicalSkillsBean();
				String[] split = item.split(",");
				bean.setReferenceDetailValue(split[CommonConstants.FALSE]);
				bean.setReferenceDetailId(Integer.parseInt(split[CommonConstants.TRUE]));
				list.add(bean);
			}
			log.info("getDetailsByTypeId end");
			return list;
		} else {
			throw new TechnicalSkillsNotFoundException("no record found with type name: " + typeName);
		}
	}

	@Override
	public List<String> getCategories(String categoryName) {
		log.info("getCategories() start");
		List<String> categoryList = commonReferenceDetailsRepo.getCategories(categoryName);
		if (categoryList != null) {
			log.info("getCategories() end");
			return categoryList;
		} else {
			throw new CategoryNotFoundException("no categories found with this " + categoryName);
		}

	}

	@Override
	public int getIdByName(String name) {
		log.info("getByName() started");
		if (name != null) {
			int id = commonReferenceDetailsRepo.getByName(name);
			log.info("getByName() ended");
			return id;
		} else {
			throw new NullPointerException("name is null");
		}

	}

	@Override
	public String getByid(int id) {
		log.info("getByid() started");
		String nameById = commonReferenceDetailsRepo.getNameById(id);
		if (nameById != null) {
			log.info("getByid() ended");
			return nameById;
		} else {
			throw new ReferenceNotFoundException("no suitable name found for this id: " + id);
		}
	}

	@Override
	public void saveReferenceDetails(CommonReferenceDetailsBean referenceDetailsBean) {
		
        CommonReferenceDetailsEntity convertBeanToEntity = convertBeanToEntity(referenceDetailsBean);
        convertBeanToEntity= commonReferenceDetailsRepo.save(convertBeanToEntity);
        CommonReferenceTypeEntity commonReferenceTypeEntity = new CommonReferenceTypeEntity();
        commonReferenceTypeEntity.setReferenceTypeName(convertBeanToEntity.getReferenceDetailValue());
        commonReferenceTypeEntity.setCreatedBy(convertBeanToEntity.getCreatedBy());
        commonReferenceTypeEntity.setIsDeleted(convertBeanToEntity.getIsDeleted());
        commonReferenceTypeEntity.setModifiedBy(convertBeanToEntity.getModifiedBy());
        commonReferenceTypeRepo.save(commonReferenceTypeEntity);
        
    }

	/**
	 * Adds a sub-skill category based on the information provided in the
	 * {@link CommonReferenceDetailsBean}.
	 *
	 * @param bean The {@link CommonReferenceDetailsBean} containing details for the
	 *             sub-skill category to be added.
	 * @throws ReferenceNotFoundException If the reference type in the provided bean
	 *                                    is null.
	 */
	@Override
	public void addSubSkillcategory(CommonReferenceDetailsBean bean) throws ReferenceNotFoundException {
		log.info("Entered into addSubSkillCategory method in service implementation");

		CommonReferenceDetailsEntity beanToEntity = convertBeanToEntity(bean);
		List<CommonReferenceDetailsEntity> existingEntities = commonReferenceDetailsRepo
				.findByReferenceDetailValue(beanToEntity.getReferenceDetailValue());
		if (!existingEntities.isEmpty()) {
			log.info("Record with referenceDetailValue " + beanToEntity.getReferenceDetailValue() + " already exists.");
			throw new RecordAlreadyExistsException(
					"Record with referenceDetailValue " + beanToEntity.getReferenceDetailValue() + " already exists.");
		}

		if (beanToEntity.getReferenceType() == null) {
			log.info("Getting referenceType null");
			throw new ReferenceNotFoundException("Reference type cannot be null");
		}

		if (beanToEntity.getIsDeleted() == null) {
			log.info("We are setting the isDeleted true here");
			beanToEntity.setIsDeleted(false);
		}

		log.info("Saving the add subSkill into referenceDetails entity");
		commonReferenceDetailsRepo.save(beanToEntity);
		log.info("Completed addSubSkillCategory method in service implementation");
	}
	@Override
	public List<String> getSubSkillCategory() throws EntityNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
}
