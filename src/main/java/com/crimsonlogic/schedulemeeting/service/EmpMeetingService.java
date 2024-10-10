package com.crimsonlogic.schedulemeeting.service;

import com.crimsonlogic.schedulemeeting.dto.EmployeeDTO;
import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.Meeting;
import java.util.Optional;

import java.util.List;
import java.util.Map;

public interface EmpMeetingService {
    
	//create new meeting
    Meeting createMeeting(Meeting meeting);
    
    //all employeesname list
    List<String> getAllEmployeeNames();
    
    //all employee list
    List<Employee> getAllEmployees();
    
    //adding participants to the meeting
    void addParticipantsToMeeting(String meetingId, List<String> employeeIds);
    
    //getting meetings for specific employee based on weather he is a creator or participant
    Map<Meeting, Boolean> getMeetingsForEmployee(String employeeId);
    
    //getting available employees based on overlapping meetings, participants 
    List<EmployeeDTO> getAvailableEmployees(String meetingId);
    
    //status update for meeting
    void updateMeetingStatuses();
       
    Map<Meeting, Boolean> getMeetingsByStatus(String employeeId, String status);
    
    List<EmployeeDTO> searchEmployeesByName(String meetingId, String name);
    
    Meeting updateMeeting(String meetingId, Meeting updatedMeeting);
    
    Optional<Meeting> findById(String meetingId);
}

