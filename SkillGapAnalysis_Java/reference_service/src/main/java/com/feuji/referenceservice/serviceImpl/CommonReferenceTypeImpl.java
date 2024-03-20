package com.feuji.referenceservice.serviceImpl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.feuji.referenceservice.bean.CommonReferenceTypeBean;
import com.feuji.referenceservice.entity.CommonReferenceTypeEntity;
import com.feuji.referenceservice.exception.ReferenceNotFoundException;
import com.feuji.referenceservice.repository.CommonReferenceTypeRepo;
import com.feuji.referenceservice.service.CommonReferenceTypeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommonReferenceTypeImpl implements CommonReferenceTypeService {


	@Autowired
	CommonReferenceTypeRepo commonReferenceTypeRepo;

	@Autowired
	ModelMapper modelMapper;

	/**
	 * Retrieves CommonReferenceTypeEntity by its type name.
	 *
	 * @param typeName The type name of the entity to retrieve.
	 * @return The CommonReferenceTypeEntity corresponding to the given type name,
	 *         or returns exception if no entity is found.
	 * 
	 */
	public CommonReferenceTypeEntity getByTypeName(String typeName)  throws ReferenceNotFoundException {
	    log.info("getByTypeName Start:Fetching reference type names");
	    CommonReferenceTypeEntity byTypeName = commonReferenceTypeRepo.getByTypeName(typeName);
	    log.info("getting reference names", byTypeName);
	    if (byTypeName == null) {
	        throw new ReferenceNotFoundException("Entity not found for type name: " + typeName);
	    }
	    log.info("getByTypeName End:Fetched reference type names");
	    return byTypeName;
	    
	}

	/**
	 * Saves a  CommonReferenceTypeEntity based on the provided CommonReferenceTypeBean.
	 *
	 * @param commonReferenceTypeBean the CommonReferenceTypeBean containing data to be saved.
	 * @return The saved  CommonReferenceTypeEntity.
	 * @throws NotFoundException if the provided CommonReferenceTypeBean does not correspond to an entity found in the repository.
	 */
	@Override
	public CommonReferenceTypeEntity saveTimesheetWeek(CommonReferenceTypeBean commonReferenceTypeBean) {
		 log.info("getByTypeName Start:Saving reference type ");
	    CommonReferenceTypeEntity commonReferenceTypeEntity = modelMapper.map(commonReferenceTypeBean,
	            CommonReferenceTypeEntity.class);
	    commonReferenceTypeEntity = commonReferenceTypeRepo.save(commonReferenceTypeEntity);
	    if (commonReferenceTypeEntity == null) {
	        throw new ReferenceNotFoundException("Entity not found for the given bean: " + commonReferenceTypeBean);
	    }
	    log.info("getByTypeName End:Saved reference type ");
	    return commonReferenceTypeEntity;
	}


}
