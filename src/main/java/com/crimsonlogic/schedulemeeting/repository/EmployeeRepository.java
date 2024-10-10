package com.crimsonlogic.schedulemeeting.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.schedulemeeting.entity.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {
	
	Employee findByEmpEmail(String empEmail);

}
