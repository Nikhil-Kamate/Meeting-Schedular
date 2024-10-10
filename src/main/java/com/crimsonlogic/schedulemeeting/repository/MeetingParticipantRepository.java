package com.crimsonlogic.schedulemeeting.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.Meeting;
import com.crimsonlogic.schedulemeeting.entity.MeetingParticipant;

@Repository
public interface MeetingParticipantRepository extends JpaRepository<MeetingParticipant, Integer> {
	
	List<MeetingParticipant> findByEmployeeEmployeeId(String employeeId);
	
	List<MeetingParticipant> findByMeeting(Meeting meeting);
	
    List<MeetingParticipant> findByEmployee(Employee employee);

}
