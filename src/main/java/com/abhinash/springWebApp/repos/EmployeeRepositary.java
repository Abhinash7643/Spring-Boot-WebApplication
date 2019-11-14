package com.abhinash.springWebApp.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.abhinash.springWebApp.entities.Employees;
import com.abhinash.springWebApp.model.EmployeeModel;
public interface EmployeeRepositary extends JpaRepository<Employees, Long>{
	
	List<Employees> findEmployeesBydeptId(Long deptId);
	
	
	List<Employees> findEmployeesBycity(String city);
	
	@Query("SELECT " +
	           "    new com.abhinash.springWebApp.model.EmployeeModel(e.city, COUNT(e)) " +
	           "FROM "
	           + "" +
	           "    Employees e " +
	           "GROUP BY " +
	           "    e.city")
	List<EmployeeModel> findCityCount();
	
	
List<Employees> findEmployeesByState(String state);
	
	@Query("SELECT " +
	           "    new com.abhinash.springWebApp.model.EmployeeModel(e.state, COUNT(e)) " +
	           "FROM " +
	           "    Employees e " +
	           "GROUP BY " +
	           "    e.state")
	List<EmployeeModel> findStateCount();
	
	
	
	
	
	
}

