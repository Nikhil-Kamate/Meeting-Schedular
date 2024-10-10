package com.crimsonlogic.schedulemeeting.service;

import com.crimsonlogic.schedulemeeting.dto.EmployeeDTO;
import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.Meeting;
import com.crimsonlogic.schedulemeeting.entity.MeetingParticipant;
import com.crimsonlogic.schedulemeeting.repository.MeetingRepository;
import com.crimsonlogic.schedulemeeting.repository.EmployeeRepository;
import com.crimsonlogic.schedulemeeting.repository.MeetingParticipantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class EmpMeetingServiceImpl implements EmpMeetingService {

    @Autowired
    private MeetingRepository meetingRepository;
    
    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private MeetingParticipantRepository meetingParticipantRepository;

    @Override
    public Meeting createMeeting(Meeting meeting) {
    	if (meeting.getMeetingCreatedOn() == null) {
            meeting.setMeetingCreatedOn(LocalDateTime.now());
        }
        if (meeting.getMeetingStatus() == null) {
            meeting.setMeetingStatus("Scheduled"); // or any default status
        }
        return meetingRepository.save(meeting);
    }
    
    public List<String> getAllEmployeeNames() {
        return employeeRepository.findAll().stream()
                .map(employee -> employee.getEmpFirstName() + " " + employee.getEmpLastName())
                .collect(Collectors.toList());
    }
    
    @Override
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll(); // Fetch all employees
    }
    
    
    @Override
    public void addParticipantsToMeeting(String meetingId, List<String> employeeIds) {

        Meeting meeting = meetingRepository.findById(meetingId)
                .orElseThrow(() -> new RuntimeException("Meeting not found"));

        List<Employee> employees = employeeRepository.findAllById(employeeIds);

        System.out.println("Retrieved Employees: " + employees);

        List<MeetingParticipant> participants = employees.stream()
                .map(employee -> {
                    MeetingParticipant participant = new MeetingParticipant();
                    participant.setMeeting(meeting);
                    participant.setEmployee(employee);
                    return participant;
                })
                .collect(Collectors.toList());

        meetingParticipantRepository.saveAll(participants);
    }
    
    @Override
    public Map<Meeting, Boolean> getMeetingsForEmployee(String employeeId) {
        Map<Meeting, Boolean> meetingsMap = new HashMap<>();

        // Fetch meetings created by the employee
        List<Meeting> createdMeetings = meetingRepository.findByMeetingCreatorEmployeeId(employeeId);
        createdMeetings.forEach(meeting -> meetingsMap.put(meeting, true));

        // Fetch meetings where the employee is a participant
        List<MeetingParticipant> participantRecords = meetingParticipantRepository.findByEmployeeEmployeeId(employeeId);
        List<Meeting> participantMeetings = participantRecords.stream()
                .map(MeetingParticipant::getMeeting)
                .distinct()
                .collect(Collectors.toList());

        // Add participant meetings with creator flag set to false
        participantMeetings.stream()
                .filter(meeting -> !meetingsMap.containsKey(meeting))
                .forEach(meeting -> meetingsMap.put(meeting, false));

        return meetingsMap;
    }
    
    @Override
    public List<EmployeeDTO> getAvailableEmployees(String meetingId) {
        // Fetch the current meeting
        Meeting currentMeeting = meetingRepository.findById(meetingId).orElse(null);
        String meetingCreatorId = currentMeeting != null ? currentMeeting.getMeetingCreator().getEmployeeId() : null; // Get creator ID

        if (currentMeeting == null) {
            // If the meeting does not exist, return all active employees with notAvailable flag set to false
            return getAllEmployees().stream()
                    .filter(employee -> "yes".equalsIgnoreCase(employee.getActive())) // Filter for active employees
                    .map(employee -> new EmployeeDTO(employee.getEmployeeId(), employee.getEmpFirstName(), employee.getEmpLastName(), false, employee.getEmpEmail(), employee.getEmpDepartment(), employee.getActive()))
                    .collect(Collectors.toList());
        }

        LocalDateTime meetingStart = currentMeeting.getMeetingStartTime();
        LocalDateTime meetingEnd = currentMeeting.getMeetingEndTime();

        // Get participants of the current meeting
        List<MeetingParticipant> currentMeetingParticipants = meetingParticipantRepository.findByMeeting(currentMeeting);
        List<String> currentMeetingParticipantIds = currentMeetingParticipants.stream()
                .map(participant -> participant.getEmployee().getEmployeeId())
                .collect(Collectors.toList());

        // Find all meetings that overlap with the current meeting
        List<Meeting> overlappingMeetings = meetingRepository.findAll().stream()
                .filter(meeting -> meeting.getMeetingStartTime().isBefore(meetingEnd) &&
                                   meeting.getMeetingEndTime().isAfter(meetingStart))
                .collect(Collectors.toList());

        // Collect all participant IDs from overlapping meetings
        List<String> overlappingMeetingParticipantIds = overlappingMeetings.stream()
                .flatMap(meeting -> meetingParticipantRepository.findByMeeting(meeting).stream())
                .map(participant -> participant.getEmployee().getEmployeeId())
                .distinct()
                .collect(Collectors.toList());

        // Collect all active employees and set availability status, excluding the meeting creator
        List<Employee> allEmployees = getAllEmployees();
        return allEmployees.stream()
                .filter(employee -> "yes".equalsIgnoreCase(employee.getActive())) // Filter for active employees
                .filter(employee -> !employee.getEmployeeId().equals(meetingCreatorId)) // Exclude meeting creator
                .map(employee -> {
                    boolean isNotAvailable = currentMeetingParticipantIds.contains(employee.getEmployeeId()) ||
                                             overlappingMeetingParticipantIds.contains(employee.getEmployeeId());
                    return new EmployeeDTO(employee.getEmployeeId(), employee.getEmpFirstName(), employee.getEmpLastName(), isNotAvailable, employee.getEmpEmail(), employee.getEmpDepartment(), employee.getActive());
                })
                .collect(Collectors.toList());
    }
    
    @Override
    public void updateMeetingStatuses() {
        LocalDateTime now = LocalDateTime.now();
        List<Meeting> meetings = meetingRepository.findAll();

        for (Meeting meeting : meetings) {
            if (meeting.getMeetingEndTime() != null && meeting.getMeetingEndTime().isBefore(now) && !"Completed".equals(meeting.getMeetingStatus())) {
                meeting.setMeetingStatus("Completed");
                meetingRepository.save(meeting);
            }
        }
    }
    
    
    @Override
    public Map<Meeting, Boolean> getMeetingsByStatus(String employeeId, String status) {
        Map<Meeting, Boolean> meetingsMap = new HashMap<>();

        // Fetch meetings created by the employee
        List<Meeting> createdMeetings = meetingRepository.findByMeetingCreatorEmployeeId(employeeId);
        createdMeetings.forEach(meeting -> {
            if (status == null || status.isEmpty() || meeting.getMeetingStatus().equalsIgnoreCase(status)) {
                meetingsMap.put(meeting, true);
            }
        });

        // Fetch meetings where the employee is a participant
        List<MeetingParticipant> participantRecords = meetingParticipantRepository.findByEmployeeEmployeeId(employeeId);
        List<Meeting> participantMeetings = participantRecords.stream()
                .map(MeetingParticipant::getMeeting)
                .distinct()
                .collect(Collectors.toList());

        // Add participant meetings with creator flag set to false
        participantMeetings.stream()
                .filter(meeting -> !meetingsMap.containsKey(meeting))
                .filter(meeting -> status == null || status.isEmpty() || meeting.getMeetingStatus().equalsIgnoreCase(status))
                .forEach(meeting -> meetingsMap.put(meeting, false));

        return meetingsMap;
    }
    
    @Override
    public List<EmployeeDTO> searchEmployeesByName(String meetingId, String name) {
        List<EmployeeDTO> allEmployees = getAvailableEmployees(meetingId);

        if (name == null || name.isEmpty()) {
            return allEmployees;
        }

        String lowerCaseName = name.toLowerCase();

        return allEmployees.stream()
                .filter(employee -> (employee.getEmpFirstName() + " " + employee.getEmpLastName()).toLowerCase().contains(lowerCaseName))
                .collect(Collectors.toList());
    }
    
    @Override
    public Optional<Meeting> findById(String meetingId) {
        return meetingRepository.findById(meetingId);
    }
    
    @Override
    public Meeting updateMeeting(String meetingId, Meeting updatedMeeting) {
        return meetingRepository.findById(meetingId).map(meeting -> {
            meeting.setMeetingTitle(updatedMeeting.getMeetingTitle());
            meeting.setMeetingDescription(updatedMeeting.getMeetingDescription());
            meeting.setMeetingStartTime(updatedMeeting.getMeetingStartTime());
            meeting.setMeetingEndTime(updatedMeeting.getMeetingEndTime());
            meeting.setMeetingType(updatedMeeting.getMeetingType());
            meeting.setMeetingStatus(updatedMeeting.getMeetingStatus());
            return meetingRepository.save(meeting);
        }).orElseThrow(() -> new RuntimeException("Meeting not found"));
    }

}
