package com.abhinash.springWebApp.service;


import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.abhinash.springWebApp.entities.Employees;
import com.abhinash.springWebApp.model.DepartmentModel;
import com.abhinash.springWebApp.model.DetailsModel;
import com.abhinash.springWebApp.repos.DepartmentRepositary;
import com.abhinash.springWebApp.repos.EmployeeRepositary;

@Service
public class EmployeeService {

	@Autowired
	EmployeeRepositary employeeRepositary;

	@Autowired
	DepartmentRepositary departmentRepositary;
   //registration
	public Employees saveEmployee(DetailsModel empDet) {
		Employees emp = new Employees();
		emp.setId(empDet.getId());
		emp.setFirstname(empDet.getFirstname());
		emp.setLastname(empDet.getLastname());
		emp.setAddress(empDet.getAddress());
		emp.setAge(empDet.getAge());
		emp.setCity(empDet.getCity());
		emp.setState(empDet.getState());
		emp.setSkills(empDet.getSkills());
		emp.setSalary(empDet.getSalary());
		emp.setGender(empDet.getGender());
		
		emp.setDeptId(departmentRepositary.getByDept(empDet.getDept()).getDeptId());
		return employeeRepositary.save(emp);
	}
	//department summary
	public List<DepartmentModel> getDepartMentDetails() {
		List<Employees> emp1 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Finance").getDeptId());
		List<Employees> emp2 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("HR").getDeptId());
		List<Employees> emp3 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Test Engineer").getDeptId());
		List<Employees> emp4 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Developer").getDeptId());
		double emp1Sal=0;
		for (Employees employees : emp1) {	
			emp1Sal = emp1Sal + employees.getSalary();
		}
		double emp2Sal=0;
		for (Employees employees : emp2) {	
			emp2Sal =  emp2Sal + employees.getSalary();
		}
		double emp3Sal=0;
		for (Employees employees : emp3) {	
			emp3Sal =  emp3Sal + employees.getSalary();
		}
		double emp4Sal=0;
		for (Employees employees : emp4) {	
			emp4Sal =  emp4Sal + employees.getSalary();
		}
		List<DepartmentModel> deptDetails = new ArrayList<DepartmentModel>();
		DepartmentModel dept1 = new DepartmentModel("Finance", emp1.size(), emp1Sal);
		DepartmentModel dept2 = new DepartmentModel("HR", emp2.size(), emp2Sal);
		DepartmentModel dept3 = new DepartmentModel("Test Engineer", emp3.size(), emp3Sal);
		DepartmentModel dept4 = new DepartmentModel("Developer", emp4.size(), emp4Sal);
		deptDetails.add(dept1);
		deptDetails.add(dept2);
		deptDetails.add(dept3);
		deptDetails.add(dept4);
		
		return deptDetails;
		
		
	}
//alldetails
	public List<DetailsModel> getAllEmployee() {
		List<DetailsModel> detailsList = new ArrayList<DetailsModel>();
		List<Employees> listEmployee = employeeRepositary.findAll();
		for (Employees emp : listEmployee) {
			DetailsModel det = new DetailsModel();
			det.setId(emp.getId());
			det.setFirstname(emp.getFirstname());
			det.setLastname(emp.getLastname());
			det.setAge(emp.getAge());
			det.setCity(emp.getCity());
			det.setAddress(emp.getAddress());
			det.setGender(emp.getGender());
			det.setSalary(emp.getSalary());
			det.setState(emp.getState());
			det.setSkills(emp.getSkills());
			
			det.setDept(departmentRepositary.findDepartmentBydeptId(emp.getDeptId()).getDept());
			detailsList.add(det);
		}
		return detailsList;
	}

	public void deleteEmployee(Employees employee) {
		employeeRepositary.delete(employee);

	}

	public Employees getEmployeeById(Long id) {
		return employeeRepositary.getOne(id);
	}
//update
	public DetailsModel getEmployeeForUpdate(Long id) {
		Employees emp = employeeRepositary.getOne(id);
		DetailsModel det = new DetailsModel();
		det.setId(emp.getId());
		det.setFirstname(emp.getFirstname());
		det.setLastname(emp.getLastname());
		det.setAge(emp.getAge());
		det.setCity(emp.getCity());
		det.setAddress(emp.getAddress());
		det.setGender(emp.getGender());
		det.setSalary(emp.getSalary());
		det.setState(emp.getState());
		det.setSkills(emp.getSkills());
		det.setDept(departmentRepositary.findDepartmentBydeptId(emp.getDeptId()).getDept());
		return det;
	}

	public Employees updateEmployee(Employees employee) {
		return employeeRepositary.save(employee);
	}


	public List<DepartmentModel> getDepartMentWiseDetailsForHighChart() {
		List<Employees> emp1 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Finance").getDeptId());
		List<Employees> emp2 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("HR").getDeptId());
		List<Employees> emp3 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Test Engineer").getDeptId());
		List<Employees> emp4 = employeeRepositary.findEmployeesBydeptId(departmentRepositary.getByDept("Developer").getDeptId());
	
		List<DepartmentModel> deptDetails = new ArrayList<DepartmentModel>();
		DepartmentModel dept1 = new DepartmentModel("Finance", emp1.size());
		DepartmentModel dept2 = new DepartmentModel("HR", emp2.size());
		DepartmentModel dept3 = new DepartmentModel("Test Engineer", emp3.size());
		DepartmentModel dept4 = new DepartmentModel("Developer", emp4.size());
		deptDetails.add(dept1);
		deptDetails.add(dept2);
		deptDetails.add(dept3);
		deptDetails.add(dept4);
		
		return deptDetails;
		
		
	}

	
	
	
	
}
