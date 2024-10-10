package com.crimsonlogic.schedulemeeting.dto;

import com.crimsonlogic.schedulemeeting.entity.Employee;

public class EmployeeDTO {
    private String employeeId;
    private String empFirstName;
    private String empLastName;
    private String empEmail;
    private String empDepartment;
    private boolean notAvailable;
    private String active;	

    // Constructors, getters, and setters
    

    public EmployeeDTO(String employeeId, String empFirstName, String empLastName, boolean notAvailable,String empEmail,String empDepartment,String active) {
        this.employeeId = employeeId;
        this.empFirstName = empFirstName;
        this.empLastName = empLastName;
        this.notAvailable = notAvailable;
        this.empEmail=empEmail;
        this.empDepartment=empDepartment;
        this.active=active;
    }

    public EmployeeDTO(Employee employee, boolean b) {
		super();
	}

	public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmpFirstName() {
        return empFirstName;
    }

    public void setEmpFirstName(String empFirstName) {
        this.empFirstName = empFirstName;
    }

    public String getEmpLastName() {
        return empLastName;
    }

    public void setEmpLastName(String empLastName) {
        this.empLastName = empLastName;
    }

    public boolean isNotAvailable() {
        return notAvailable;
    }

    public void setNotAvailable(boolean notAvailable) {
        this.notAvailable = notAvailable;
    }

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpDepartment() {
		return empDepartment;
	}

	public void setEmpDepartment(String empDepartment) {
		this.empDepartment = empDepartment;
	}
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
    
}

