package com.abhinash.springWebApp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.abhinash.springWebApp.entities.Employees;
import com.abhinash.springWebApp.model.DepartmentModel;
import com.abhinash.springWebApp.model.DetailsModel;
import com.abhinash.springWebApp.model.EmployeeModel;
import com.abhinash.springWebApp.repos.EmployeeRepositary;
import com.abhinash.springWebApp.service.EmployeeService;


@Controller
public class DetailsController {

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	EmployeeRepositary employeerepositery;
	
   //shows details
	@RequestMapping("/employeeDetails")
	public String getAllEmployee(@RequestParam( required = false, value="page") Integer page, @RequestParam( required = false, value="msg") String msg, ModelMap modelMap) {
		if (page == null) page = 1;
		Integer a=(page * 5) - 5;
		Integer b=a+5;
		java.util.List<DetailsModel> employeeList = employeeService.getAllEmployee();
		Integer size = employeeList.size();
		if (b > size) b = size;
		employeeList = employeeList.subList(a,b);
		List<DepartmentModel>  deptDetails = employeeService.getDepartMentDetails();
		modelMap.addAttribute("size", size);
		if (msg != null) modelMap.addAttribute("updateMessage", msg);
		modelMap.addAttribute("empDetails", employeeList);
		return "demo";
		
	}
   
	@RequestMapping("/register")
	public String registerEmployee(ModelMap modelMap) {
		modelMap.addAttribute("action", "registerEmployee");
		return "registration1";
	}
	
	//register
	@PostMapping(value = "/registerEmployee")
	public RedirectView employeeRegister(@ModelAttribute("empDetails") DetailsModel empDetails, ModelMap modelMap) {
		employeeService.saveEmployee(empDetails);	
		RedirectView redirectView = new RedirectView();
		redirectView.setContextRelative(true);
		redirectView.setUrl("/employeeDetails?msg=Data successfully register for employee.");
		return redirectView;
		
	}
	
     //delete
	@RequestMapping("/deleteEmployee")
	public RedirectView deleteEmployee(@RequestParam("id") Long id, ModelMap modelmap) {
		Employees employee = employeeService.getEmployeeById(id);
		employeeService.deleteEmployee(employee);
		RedirectView redirectView = new RedirectView();
		redirectView.setContextRelative(true);
		redirectView.setUrl("/employeeDetails?msg=Data successfully deleted for employee.");
		return redirectView;
		
	}
	
	@RequestMapping("/showEmployeeModify")
	public String showUpdate(@RequestParam("id") Long id,ModelMap modelmap) {
		DetailsModel details = employeeService.getEmployeeForUpdate(id);
		modelmap.addAttribute("empDetails", details);
	    modelmap.addAttribute("action", "modifyEmployee");
		return "registration1";
		
	}
	
	@RequestMapping("/modifyEmployee")
	public RedirectView modifyEmployee(@ModelAttribute("empDetails") DetailsModel empDetails, ModelMap modelMap) {
		employeeService.saveEmployee(empDetails);
		java.util.List<DetailsModel> employeeList = employeeService.getAllEmployee();
		RedirectView redirectView = new RedirectView();
		redirectView.setContextRelative(true);
		redirectView.setUrl("/employeeDetails?msg=Data successfully modify for employee.");
		return redirectView;
		
	}
	@RequestMapping("/logout")
	public RedirectView logOut()
	{
		RedirectView redirectView = new RedirectView();
		redirectView.setContextRelative(true);
		redirectView.setUrl("/login");
		return redirectView;
	}
	
	
	//for high chart
	@GetMapping("/getHighChartDetailsDepartMentWise")
	public String getDepartmentWiseDetails(ModelMap modelMap) {
		List<DepartmentModel>  deptDetails = employeeService.getDepartMentWiseDetailsForHighChart();
		List<EmployeeModel> emp = employeerepositery.findCityCount();
		List<EmployeeModel> emp1= employeerepositery.findStateCount();
		modelMap.addAttribute("city", emp);
		modelMap.addAttribute("state", emp1);
		modelMap.addAttribute("barchart", deptDetails);
		return "highChart";
	}
	
	
	

}
