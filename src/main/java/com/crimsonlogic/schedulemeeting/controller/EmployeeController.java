package com.crimsonlogic.schedulemeeting.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.service.HrAdminService;


/**
 * Controller which handle employee details for adding and editing
 * Author : Nikhil Kamate
 */


@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private HrAdminService hrAdminService; 

	@GetMapping("/registerempform")
	public String showRegistrationForm(Model model) {
		model.addAttribute("employee", new Employee());
		List<String> managerNames = hrAdminService.getAllManagerNames();
		model.addAttribute("managerNames", managerNames);
		return "empregister";
	}

	@PostMapping("/registeremployee")
	public String registerEmployee(@ModelAttribute("employee") Employee emp, Model model) {
		hrAdminService.saveEmployee(emp);
		model.addAttribute("employees", hrAdminService.getAllEmployees());
		return "redirect:/employee/listallemployee";
	}

	@GetMapping("/listallemployee")
	public String listAllEmployees(Model model) {
		model.addAttribute("employees", hrAdminService.getAllEmployees());
		return "listemployees";
	}
	
	 @GetMapping("/edit/{employeeId}")
	    public String editEmployeeForm(@PathVariable("employeeId") String employeeId, Model model) {
	        Employee employee = hrAdminService.getEmployeeById(employeeId);
	        model.addAttribute("employee", employee);
	        List<String> managerNames = hrAdminService.getAllManagerNames();
	        model.addAttribute("managerNames", managerNames);
	        return "empedit";
	    }

	    // Method to handle the update request
	 @PostMapping("/update/{employeeId}")
	    public String updateEmployee(@PathVariable("employeeId") String employeeId,
	                                 @ModelAttribute("employee") Employee updatedEmployee,
	                                 Model model) {
	        Optional<Employee> updatedEmp = hrAdminService.updateEmployee(employeeId, updatedEmployee);
	        if (updatedEmp.isPresent()) {
	            model.addAttribute("employees", hrAdminService.getAllEmployees());
	            return "redirect:/employee/listallemployee";
	        } else {
	            model.addAttribute("error", "Employee not found");
	            return "empedit";
	        }
	    }
}
