package com.crimsonlogic.schedulemeeting.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.schedulemeeting.dto.EmployeeDTO;
import com.crimsonlogic.schedulemeeting.service.EmpMeetingService;

@Controller
@RequestMapping("/employees")
public class FetchEmployeeNameController {

	@Autowired
    private EmpMeetingService empMeetingService;

    @GetMapping("/names")
    public String getEmployeeNames(@RequestParam("meetingId") String meetingId ,Model model) {
        List<EmployeeDTO> employees = empMeetingService.getAvailableEmployees(meetingId);
        model.addAttribute("employees", employees);
        model.addAttribute("meetingId", meetingId);
        return "employeeList"; 
    }
    
    @GetMapping("/search")
    public String searchEmployees(@RequestParam("meetingId") String meetingId,
                                  @RequestParam(value = "name", required = false, defaultValue = "") String name,
                                  Model model) {
        List<EmployeeDTO> employees = empMeetingService.searchEmployeesByName(meetingId, name);
        model.addAttribute("employees", employees);
        model.addAttribute("meetingId", meetingId);
        model.addAttribute("searchName", name);
        return "employeeList";
    }
}


