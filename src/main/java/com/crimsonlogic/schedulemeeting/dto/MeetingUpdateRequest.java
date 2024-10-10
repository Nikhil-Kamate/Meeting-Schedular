package com.crimsonlogic.schedulemeeting.dto;

import java.time.LocalDateTime;

public class MeetingUpdateRequest {

	private String meetingId;
	private String meetingTitle;
    private String meetingDescription;
    private LocalDateTime meetingStartTime;
    private LocalDateTime meetingEndTime;
    private String meetingType;
    private String meetingStatus;

    // Getters and Setters
    
    
    public String getMeetingTitle() {
        return meetingTitle;
    }

    public String getMeetingId() {
		return meetingId;
	}

	public void setMeetingId(String meetingId) {
		this.meetingId = meetingId;
	}

	public void setMeetingTitle(String meetingTitle) {
        this.meetingTitle = meetingTitle;
    }

    public String getMeetingDescription() {
        return meetingDescription;
    }

    public void setMeetingDescription(String meetingDescription) {
        this.meetingDescription = meetingDescription;
    }

    public LocalDateTime getMeetingStartTime() {
        return meetingStartTime;
    }

    public void setMeetingStartTime(LocalDateTime meetingStartTime) {
        this.meetingStartTime = meetingStartTime;
    }

    public LocalDateTime getMeetingEndTime() {
        return meetingEndTime;
    }

    public void setMeetingEndTime(LocalDateTime meetingEndTime) {
        this.meetingEndTime = meetingEndTime;
    }

    public String getMeetingType() {
        return meetingType;
    }

    public void setMeetingType(String meetingType) {
        this.meetingType = meetingType;
    }

    public String getMeetingStatus() {
        return meetingStatus;
    }

    public void setMeetingStatus(String meetingStatus) {
        this.meetingStatus = meetingStatus;
    }
}
