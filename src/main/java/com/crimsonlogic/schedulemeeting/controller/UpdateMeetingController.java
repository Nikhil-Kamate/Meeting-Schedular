package com.crimsonlogic.schedulemeeting.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.Meeting;
import com.crimsonlogic.schedulemeeting.service.EmpMeetingService;

@Controller
@RequestMapping("/meeting")
public class UpdateMeetingController {

    @Autowired
    private EmpMeetingService empMeetingService;

    @GetMapping("/{meetingId}/edit")
    public String showEditForm(@PathVariable("meetingId") String meetingId, HttpSession session, Model model) {
        Meeting meeting = empMeetingService.findById(meetingId)
            .orElseThrow(() -> new RuntimeException("Meeting not found"));

        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        if (loggedInEmployee == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        model.addAttribute("meeting", meeting);
        model.addAttribute("creatorId", loggedInEmployee.getEmployeeId()); // Set creatorId in model
        return "editMeetingForm"; // Ensure this JSP file is in the correct path
    }
        
    @PostMapping("/{meetingId}/update")
    public String updateMeeting(
            @PathVariable("meetingId") String meetingId,
            @ModelAttribute Meeting meeting,
            @RequestParam("creatorId") String creatorId,
            @RequestParam(value = "status", required = false) String status) {

        empMeetingService.updateMeeting(meetingId, meeting);

        // Redirect to the filter page with creatorId and status
        return "redirect:/employee/meeting/filterByCreator?creatorId=" + creatorId + "&status=" + (status != null ? status : "");
    }

    @GetMapping("/filter")
    public String filterMeetingsByCreator(
            @RequestParam("creatorId") String creatorId,
            @RequestParam(value = "status", required = false) String status,
            Model model) {
        empMeetingService.updateMeetingStatuses();
        Map<Meeting, Boolean> meetingsMap = empMeetingService.getMeetingsByStatus(creatorId, status);
        model.addAttribute("meetingsMap", meetingsMap);
        model.addAttribute("selectedStatus", status);
        return "meetingCreated";
    }
}
