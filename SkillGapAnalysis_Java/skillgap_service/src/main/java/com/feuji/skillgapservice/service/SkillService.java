package com.feuji.skillgapservice.service;

import java.util.List;

import com.feuji.skillgapservice.bean.SkillBean;
import com.feuji.skillgapservice.dto.SkillNamesDto;
import com.feuji.skillgapservice.exception.RecordNotFoundException;
import com.feuji.skillgapservice.exception.SkillNotFoundException;

public interface SkillService {
	public SkillBean saveSkill(SkillBean skillBean);

	public SkillBean getSkillByUuid(String uuid) throws SkillNotFoundException;

	public SkillBean updateSkillDetails(SkillBean skillBean);

	public List<SkillBean> getAllSkills() throws RecordNotFoundException;

	public List<SkillBean> getSkillsByTechCategoryId(int categoryId);

	public SkillBean getSkillBySkillId(int skillId);

	public List<SkillNamesDto> getSkillNamesBySkillId(int[] skillIds) throws RecordNotFoundException;

	public void updateStatusBySkillId(Integer skillId, Byte status) throws RecordNotFoundException;
}
