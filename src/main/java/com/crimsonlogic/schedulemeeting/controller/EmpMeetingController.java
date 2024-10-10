package com.crimsonlogic.schedulemeeting.controller;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.Meeting;
import com.crimsonlogic.schedulemeeting.service.EmpMeetingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;	

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/employee/meeting")
public class EmpMeetingController {

    @Autowired
    private EmpMeetingService empMeetingService;

    @GetMapping("/create")
    public String showCreateMeetingForm(Model model) {
        model.addAttribute("meeting", new Meeting()); 
        return "createMeetingForm";
    }

    @PostMapping("/create")
    public String createMeeting(@Valid @ModelAttribute("meeting") Meeting meeting, 
                                HttpSession session, 
                                Model model) {

        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        
        if (loggedInEmployee == null) {
            model.addAttribute("error", "You need to be logged in to add a meeting.");
            return "error";
        }
        
        meeting.setMeetingCreator(loggedInEmployee);
        Meeting savedMeeting = empMeetingService.createMeeting(meeting);
        model.addAttribute("meeting", savedMeeting);
        
        return "redirect:/employee/meeting/filterByCreator?creatorId=" + loggedInEmployee.getEmployeeId();
    }

    @GetMapping("/filterByCreator")
    public String filterMeetingsByCreator(@RequestParam("creatorId") String creatorId, Model model) {
    	 empMeetingService.updateMeetingStatuses(); 
    	 Map<Meeting, Boolean> meetingsMap = empMeetingService.getMeetingsForEmployee(creatorId);
        model.addAttribute("meetingsMap", meetingsMap); 
        return "meetingCreated"; 
    }
    
    @GetMapping("/meetingdetails")
	public String getMeetingsByCreator(@RequestParam("creatorId") String creatorId, Model model) {
		empMeetingService.updateMeetingStatuses();
		Map<Meeting, Boolean> meetingsMap = empMeetingService.getMeetingsForEmployee(creatorId);
		model.addAttribute("meetingsMap", meetingsMap);
		return "meetingdetails"; // Forward to the JSP page
	}
    
    @PostMapping("/addParticipants")
    public String addParticipantsToMeeting(@RequestParam("meetingId") String meetingId,
                                            @RequestParam("participants") List<String> employeeIds,
                                            HttpSession session, // Inject HttpSession here
                                            Model model) {
    	
    	 System.out.println("Meeting ID: " + meetingId);
    	 System.out.println("Employee IDs: " + employeeIds); 
    	 
        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        
        if (loggedInEmployee == null) {
            model.addAttribute("error", "You need to be logged in to add participants.");
            return "error";
        }
        
        try {
            empMeetingService.addParticipantsToMeeting(meetingId, employeeIds);
            return "redirect:/employee/meeting/filterByCreator?creatorId=" + loggedInEmployee.getEmployeeId();
        } catch (Exception e) {
            model.addAttribute("error", "Failed to add participants: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/filter")
    public String filterMeetings(
            @RequestParam("creatorId") String creatorId,
            @RequestParam(value = "status", required = false) String status,
            Model model) {

        Map<Meeting, Boolean> meetingsMap = empMeetingService.getMeetingsByStatus(creatorId, status);
        model.addAttribute("meetingsMap", meetingsMap);
        model.addAttribute("selectedStatus", status); // Pass selected status to JSP
        return "meetingCreated";
    }
    
}