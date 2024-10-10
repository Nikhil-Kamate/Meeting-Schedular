package com.crimsonlogic.schedulemeeting.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

import com.crimsonlogic.schedulemeeting.util.IdGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * Represents the Employee Entity
 * Author : Nikhil Kamate
 */

@Data
@NoArgsConstructor
@ToString
@Entity
@Table(name = "employee")
public class Employee implements Serializable {

    private static final long serialVersionUID = -8353696000324348344L;

    @Id
    @Column(name = "employee_id")
    private String employeeId;

    @Column(name = "first_name", nullable = false, length = 50)
    private String empFirstName;

    @Column(name = "last_name", nullable = false, length = 50)
    private String empLastName;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String empEmail;

    @Column(name = "password", nullable = false, length = 100)
    private String empPassword;

    @Column(name = "department", length = 100)
    private String empDepartment;

    @Column(name = "phone_number", length = 15)
    private String empPhoneNumber;

    @Column(name = "is_manager", nullable = false, length = 3)
    private String empIsManager;

    @Column(name = "manager_name", length = 100)
    private String empManagerName; 

    @Column(name = "active", nullable = false, length = 3)
    private String active = "yes";
    
    @PrePersist
    public void generateId() {
        this.employeeId = "emp-" + IdGenerator.generateRandomID();
    }

    @OneToMany(mappedBy = "meetingCreator", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @ToString.Exclude // Prevent recursive toString calls
    private List<Meeting> meetingsCreated;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @ToString.Exclude // Prevent recursive toString calls
    private List<MeetingParticipant> meetingParticipants;
}
