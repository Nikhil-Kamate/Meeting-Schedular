package com.crimsonlogic.schedulemeeting.service;

import java.util.Base64;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.HRAdmin;
import com.crimsonlogic.schedulemeeting.exception.UserAuthenticationException;
import com.crimsonlogic.schedulemeeting.repository.EmployeeRepository;
import com.crimsonlogic.schedulemeeting.repository.HrAdminRepository;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private HrAdminRepository hrAdminRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public HRAdmin authenticateHRAdmin(String username, String password) {
    	log.info("Authenticating HR Admin with username: {}", username);
        HRAdmin hrAdmin = hrAdminRepository.findByUsername(username);
        if (hrAdmin != null && hrAdmin.getPassword().equals(password)) {
            return hrAdmin;
        }
        log.warn("Authentication failed for HR Admin with username: {}", username);
        return null;
    }

    @Override
    public Employee authenticateEmployee(String email, String password) throws UserAuthenticationException {
    	 log.info("Authenticating Employee with email: {}", email);
        Employee employee = employeeRepository.findByEmpEmail(email);
        
        if (employee != null) {
            // Check if employee is active
            if ("yes".equalsIgnoreCase(employee.getActive())) {
            	
                // Decode password and check if it matches
                String encodedPassword = employee.getEmpPassword();
                byte[] decodedBytes = Base64.getDecoder().decode(encodedPassword);
                String decodedPassword = new String(decodedBytes);
                if (decodedPassword.equals(password)) {
                	log.info("Employee authenticated successfully for email: {}", email);
                    return employee;
                } else {
                	log.warn("Invalid password for employee with email: {}", email);
                    throw new UserAuthenticationException("Invalid email or password");
                }
            } else {
            	log.warn("Authentication failed: Employee with email {} is expired", email);
                throw new UserAuthenticationException("User expired");
            }
        } else {
        	log.warn("Authentication failed: User not found for email {}", email);
            throw new UserAuthenticationException("User not found");
        }
    }
}

