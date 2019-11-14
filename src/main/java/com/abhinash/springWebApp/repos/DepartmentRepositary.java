package com.abhinash.springWebApp.repos;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.abhinash.springWebApp.entities.Department;



public interface DepartmentRepositary extends JpaRepository<Department, Long> {

	Department findDepartmentBydeptId(Long deptId);

	@Query("from Department where dept = :deptName")
	public Department getByDept(@Param("deptName") String name);

}

