package com.crimsonlogic.schedulemeeting.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.schedulemeeting.entity.Meeting;

@Repository
public interface MeetingRepository extends JpaRepository<Meeting, String> {
	
	List<Meeting> findByMeetingCreator_EmployeeId(String creatorId);
	
	List<Meeting> findByMeetingCreatorEmployeeId(String creatorId);
	
	List<Meeting> findByMeetingStatus(String status);

}
