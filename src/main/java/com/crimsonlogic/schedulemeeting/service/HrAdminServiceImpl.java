package com.crimsonlogic.schedulemeeting.service;

import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.repository.EmployeeRepository;

@Service
@Transactional
public class HrAdminServiceImpl implements HrAdminService {

    @Autowired
    private EmployeeRepository employeeRepository;


    @Override
    public Employee saveEmployee(Employee employee) {
    	// Encrypt the password before saving
	    String empPassword = employee.getEmpPassword();
	    String encryptedPassword = Base64.getEncoder().encodeToString(empPassword.getBytes());
	    employee.setEmpPassword(encryptedPassword);
        return employeeRepository.save(employee);
    }

    @Override
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public List<String> getAllManagerNames() {
        return employeeRepository.findAll().stream()
                .filter(employee -> "yes".equalsIgnoreCase(employee.getEmpIsManager()))
                .map(manager -> manager.getEmpFirstName() + " " + manager.getEmpLastName())
                .collect(Collectors.toList());
    }

	@Override
	public Employee getEmployeeById(String employeeId) {
		return employeeRepository.findById(employeeId).orElseThrow(() -> new RuntimeException("Employee not found"));
	}
	
	 @Override
	    public Optional<Employee> updateEmployee(String employeeId, Employee updatedEmployee) {
	        return employeeRepository.findById(employeeId).map(existingEmployee -> {
	            existingEmployee.setEmpFirstName(updatedEmployee.getEmpFirstName());
	            existingEmployee.setEmpLastName(updatedEmployee.getEmpLastName());
	            existingEmployee.setEmpEmail(updatedEmployee.getEmpEmail());
	            existingEmployee.setEmpPassword(updatedEmployee.getEmpPassword());
	            existingEmployee.setEmpDepartment(updatedEmployee.getEmpDepartment());
	            existingEmployee.setEmpPhoneNumber(updatedEmployee.getEmpPhoneNumber());
	            existingEmployee.setEmpIsManager(updatedEmployee.getEmpIsManager());
	            existingEmployee.setEmpManagerName(updatedEmployee.getEmpManagerName());
	            existingEmployee.setActive(updatedEmployee.getActive());
	            return employeeRepository.save(existingEmployee);
	        });
	    }
}
