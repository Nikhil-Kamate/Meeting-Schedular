package com.crimsonlogic.schedulemeeting.service;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.HRAdmin;
import com.crimsonlogic.schedulemeeting.exception.UserAuthenticationException;

public interface UserService {
	
	 HRAdmin authenticateHRAdmin(String username, String password);
	 
	 Employee authenticateEmployee(String email, String password) throws UserAuthenticationException;

}
