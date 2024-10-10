package com.crimsonlogic.schedulemeeting.service;

import java.util.*;

import com.crimsonlogic.schedulemeeting.entity.Employee;

public interface  HrAdminService {
	
	Employee saveEmployee(Employee employee);
	
	List<Employee> getAllEmployees();
	
	List<String> getAllManagerNames();
	
	Employee getEmployeeById(String employeeId);
	
	Optional<Employee> updateEmployee(String employeeId, Employee updatedEmployee);

}
