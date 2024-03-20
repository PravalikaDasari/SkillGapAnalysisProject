package com.feuji.timesheetentryservice.dto;
public class ProjectNameTaskDto {

	private Long accountProjectId;

    private String accountProjectName;

    private Long taskTypeId;

    private String taskTypeName;
   
    
  
    public Long getAccountProjectId() {
		return accountProjectId;
	}



	public void setAccountProjectId(Long accountProjectId) {
		this.accountProjectId = accountProjectId;
	}



	public String getAccountProjectName() {
		return accountProjectName;
	}



	public void setAccountProjectName(String accountProjectName) {
		this.accountProjectName = accountProjectName;
	}



	public Long getTaskTypeId() {
		return taskTypeId;
	}



	public void setTaskTypeId(Long taskTypeId) {
		this.taskTypeId = taskTypeId;
	}



	public String getTaskTypeName() {
		return taskTypeName;
	}



	public void setTaskTypeName(String taskTypeName) {
		this.taskTypeName = taskTypeName;
	}



	public ProjectNameTaskDto(Long accountProjectId, String accountProjectName, Long taskTypeId, String taskTypeName) {
		super();
		this.accountProjectId = accountProjectId;
		this.accountProjectName = accountProjectName;
		this.taskTypeId = taskTypeId;
		this.taskTypeName = taskTypeName;
	}



	public ProjectNameTaskDto() {
		// TODO Auto-generated constructor stub
	}



	@Override
	public String toString() {
		return "ProjectNameTaskDto [accountProjectId=" + accountProjectId + ", accountProjectName=" + accountProjectName
				+ ", taskTypeId=" + taskTypeId + ", taskTypeName=" + taskTypeName + "]";
	}



}
