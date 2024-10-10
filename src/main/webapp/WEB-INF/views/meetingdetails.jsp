<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Scheduled Meeting Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            overflow: auto;
        }
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://github.com/Nikhil-Kamate/Photo/blob/master/loginimage.jpeg?raw=true') no-repeat center center;
            background-size: cover;
            filter: blur(8px);
            z-index: -2;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: -1;
        }
        .container {
            position: relative;
            z-index: 0;
            padding: 20px;
        }
        .card {
            width: 100%;
            display: flex;
            margin-bottom: 20px;
        }
        .date-section {
            font-size: 2rem;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            width: 30%;
            text-align: center;
        }
        .details-section {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            width: 70%;
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    <br><br><br><br>
    
    <div class="container">
        <h2 style="text-align: center; margin: 0; padding: 20px 0; color: white;">Scheduled Meeting Details</h2>
        <div class="row">
            <c:set var="hasScheduledMeetings" value="false" />
            <c:forEach var="entry" items="${meetingsMap}">
                <c:set var="meeting" value="${entry.key}" />
                <c:if test="${meeting.meetingStatus == 'Scheduled'}">
                    <c:set var="hasScheduledMeetings" value="true" />
                    <div class="col-md-12">
                        <div class="card">
                            <c:set var="meetingDate" value="${fn:substring(meeting.meetingStartTime, 0, 10)}" />
                            <div class="date-section">
                                ${meetingDate}
                            </div>
                            <div class="details-section">
                                <h4>${meeting.meetingTitle}</h4>
                                <p>
                                    <strong>Meeting ID:</strong> ${meeting.meetingId}<br>
                                    <strong>Start Time:</strong> ${meeting.meetingStartTime}<br>
                                    <strong>End Time:</strong> ${meeting.meetingEndTime}<br>
                                    <strong>Created On:</strong> ${meeting.meetingCreatedOn}<br>
                                    <strong>Type:</strong> ${meeting.meetingType}<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
            <c:if test="${not hasScheduledMeetings}">
                <div class="col-md-12">
                    <div class="alert alert-warning" role="alert">
                        No Meeting Scheduled
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
