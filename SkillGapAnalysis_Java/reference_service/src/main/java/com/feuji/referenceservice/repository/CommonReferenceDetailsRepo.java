package com.feuji.referenceservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.feuji.referenceservice.entity.CommonReferenceDetailsEntity;

public interface CommonReferenceDetailsRepo extends JpaRepository<CommonReferenceDetailsEntity, Long> {

	@Query(value = "select reference_details_values,reference_details_id from common_reference_details rd where rd.reference_type_id=(select reference_type_id from common_reference_type where reference_type_name=:typeName)", nativeQuery = true)
	public List<String> getDetailsByTypeName(String typeName);


	@Query(value = "SELECT reference_details_id FROM common_reference_details WHERE reference_details_values = ?", nativeQuery = true)
	public int getByName(String name);

	@Query(value = "select reference_details_values from common_reference_details where reference_details_id=:id ", nativeQuery = true)
	public String getNameById(int id);

	@Query(value = "select reference_details_values from common_reference_details where "
			+ "reference_type_id=(select reference_type_id from common_reference_type "
			+ "where reference_type_name=:category)", nativeQuery = true)
	public List<String> getCategories(String category);

	

	@Query(value = "SELECT DISTINCT cr.reference_details_values,cr.reference_type_id FROM common_reference_details cr"
			+ " inner JOIN skills s "
			+ "  on s.techinical_category_id=cr.reference_details_id ", nativeQuery = true)
    List<Object[]> findDistinctReferenceDetailsValues();

    List<CommonReferenceDetailsEntity> findByReferenceDetailValue(String referenceDetailValue);

}
