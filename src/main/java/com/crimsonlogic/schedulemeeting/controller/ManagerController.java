package com.crimsonlogic.schedulemeeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crimsonlogic.schedulemeeting.service.HrAdminService;


@Controller
@RequestMapping("/managers")
public class ManagerController {
    
    @Autowired
    private HrAdminService hrAdminService;
    
    @GetMapping("/names")
    public String getManagerNames(Model model) {
        List<String> managerNames = hrAdminService.getAllManagerNames();
        model.addAttribute("managerNames", managerNames);
        return "managerList"; 
    }
}
