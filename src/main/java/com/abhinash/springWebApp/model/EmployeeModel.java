package com.abhinash.springWebApp.model;

public class EmployeeModel {
private String city;
	
	private Long empCount;
	
	private String skills;
	
	private String state;

	
	public EmployeeModel(String city, Long empCount) {
		super();
		this.city = city;
		this.empCount = empCount;
	}
	

	public EmployeeModel(Long empCount, String state) {
		super();
		this.empCount = empCount;
		this.state = state;
	}

	public String getState() {
		return state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Long getEmpCount() {
		return empCount;
	}

	public void setEmpCount(Long empCount) {
		this.empCount = empCount;
	}



	public String getSkill() {
		return skills;
	}



	public void setSkill(String skill) {
		this.skills = skill;
	}

}
