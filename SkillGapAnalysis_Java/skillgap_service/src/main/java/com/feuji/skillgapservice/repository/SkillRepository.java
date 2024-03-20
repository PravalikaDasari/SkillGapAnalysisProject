package com.feuji.skillgapservice.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.feuji.skillgapservice.dto.SkillNamesDto;
import com.feuji.skillgapservice.entity.SkillEntity;

public interface SkillRepository extends JpaRepository<SkillEntity, Integer> {

	Optional<SkillEntity> findByUuid(String uuid);

	@Query(value = "select * from skills where techinical_category_id =:categoryId", nativeQuery = true)
	List<SkillEntity> findByTechinicalCategoryId(int categoryId);

	@Query("SELECT new com.feuji.skillgapservice.dto.SkillNamesDto(s.skillName, sc.skillTypeId, "
			+ "crd.referenceDetailValue as skillTypeId " + ")" + "FROM SkillEntity s "
			+ "inner join SkillCompetencyEntity sc on s.skillId=sc.skillId "
			+ "inner join CommonReferenceDetailsEntity crd on sc.skillTypeId = crd.referenceDetailId "
			+ "where s.skillId in :skillIds")
	List<SkillNamesDto> getSkills(int[] skillIds);

	Optional<SkillEntity> findBySkillName(String skillName);

}
