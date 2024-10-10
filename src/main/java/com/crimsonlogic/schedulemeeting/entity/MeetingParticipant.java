package com.crimsonlogic.schedulemeeting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Represents the Meeting Participant Entity 
 * Author : Nikhil Kamate
 */


@Data
@NoArgsConstructor
@Entity
@Table(name = "meeting_participant")
public class MeetingParticipant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "participant_id")
    private int participantId;

    @ManyToOne
    @JoinColumn(name = "meeting_id", nullable = false)
    @JsonIgnore
    private Meeting meeting;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;
    
    @Override
    public String toString() {
        return "MeetingParticipant{" +
               "participantId=" + participantId +
               ", meeting=" + (meeting != null ? meeting.getMeetingId() : "null") +
               ", employee=" + (employee != null ? employee.getEmployeeId() : "null") +
               '}';
    }
}
