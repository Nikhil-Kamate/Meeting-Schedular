package com.crimsonlogic.schedulemeeting.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.schedulemeeting.entity.Employee;
import com.crimsonlogic.schedulemeeting.entity.HRAdmin;
import com.crimsonlogic.schedulemeeting.exception.UserAuthenticationException;
import com.crimsonlogic.schedulemeeting.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {

    private static final Logger LOG = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
    	LOG.info("Displaying login page.");
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password,
                        Model model, HttpSession session) {
    	LOG.info("Login attempt with username: {}", username);

        try {
            // Attempt HRAdmin authentication
            HRAdmin hrAdmin = userService.authenticateHRAdmin(username, password);
            if (hrAdmin != null) {
                session.setAttribute("loggedInUser", hrAdmin);
                LOG.info("HR Admin authenticated successfully: {}", username);
                return "redirect:/login/dashboard";
            }

            // Attempt Employee authentication
            Employee employee = userService.authenticateEmployee(username, password);
            session.setAttribute("loggedInEmployee", employee);
            LOG.info("Employee authenticated successfully: {}", username);
            return "redirect:/login/employee/dashboard";

        } catch (UserAuthenticationException e) {
        	 LOG.warn("Authentication failed for username: {}. Reason: {}", username, e.getMessage());
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }

    @GetMapping("/dashboard")
    public String showHrAdminDashboard() {
    	LOG.info("Displaying HR Admin dashboard.");
        return "hrdashboard";
    }

    @GetMapping("/employee/dashboard")
    public String showEmployeeDashboard() {
    	LOG.info("Displaying Employee dashboard.");
        return "empdashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        LOG.info("User logged out successfully.");
        return "../../index";
    }
}
