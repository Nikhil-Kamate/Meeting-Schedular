package com.crimsonlogic.schedulemeeting.entity;

import java.time.LocalDateTime;
import java.util.List;
import javax.persistence.*;

import com.crimsonlogic.schedulemeeting.util.IdGenerator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Represents the Meeting Entity  
 * Author : Nikhil Kamate
 */

@Data
@NoArgsConstructor
@Entity
@Table(name = "meeting")
public class Meeting {

    @Id
    @Column(name = "meeting_id")
    private String meetingId;

    @Column(name = "meeting_title", nullable = false, length = 100)
    private String meetingTitle;

    @Column(name = "meeting_description", length = 500)
    private String meetingDescription;

    @ManyToOne
    @JoinColumn(name = "meeting_creator_id", nullable = false)
    private Employee meetingCreator;

    @Column(name = "meeting_start_time", nullable = false)
    private LocalDateTime meetingStartTime;

    @Column(name = "meeting_end_time", nullable = false)
    private LocalDateTime meetingEndTime;

    @Column(name = "meeting_type", length = 50)
    private String meetingType;

    @Column(name = "meeting_created_on", nullable = false)
    private LocalDateTime meetingCreatedOn;

    @Column(name = "meeting_status", nullable = false, length = 20)
    private String meetingStatus;

    @OneToMany(mappedBy = "meeting", fetch = FetchType.EAGER)
    @JsonIgnore // Prevents recursive serialization
    private List<MeetingParticipant> meetingParticipants;

    @PrePersist
    public void generateId() {
        this.meetingId = "MID-" + IdGenerator.generateRandomID();
        this.meetingCreatedOn = LocalDateTime.now();
        System.out.println("Generated Meeting Created On: " + this.meetingCreatedOn);
    }
    
}
