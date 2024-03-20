package com.feuji.referenceservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.feuji.referenceservice.entity.CommonReferenceTypeEntity;

public interface CommonReferenceTypeRepo extends JpaRepository<CommonReferenceTypeEntity,Long>{
	
	@Query(value = "select reference_type_id from common_reference_type where reference_type_name=?",nativeQuery = true)
	public CommonReferenceTypeEntity getByTypeName(String typeName);
}
