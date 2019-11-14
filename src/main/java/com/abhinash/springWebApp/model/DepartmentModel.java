package com.abhinash.springWebApp.model;

public class DepartmentModel {

	private String deptName;
	private int noOfEmployee;
	private double totalSalary;
	
	public DepartmentModel(String deptName, int noOfEmployee, double totalSalary) {
		super();
		this.deptName = deptName;
		this.noOfEmployee = noOfEmployee;
		this.totalSalary = totalSalary;
	}
	
	
	public DepartmentModel(String deptName, int noOfEmployee) {
		super();
		this.deptName = deptName;
		this.noOfEmployee = noOfEmployee;
	}


	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getNoOfEmployee() {
		return noOfEmployee;
	}
	public void setNoOfEmployee(int noOfEmployee) {
		this.noOfEmployee = noOfEmployee;
	}
	public double getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(double totalSalary) {
		this.totalSalary = totalSalary;
	}	
	
}

