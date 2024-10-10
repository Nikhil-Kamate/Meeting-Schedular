<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meeting List</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>

body, html {
    height: 100%;
    margin: 0;
    overflow: auto; /* Allow scrolling */
}

.background-image {
    position: fixed; /* Fix the background image */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background:
        url('https://github.com/Nikhil-Kamate/Photo/blob/master/loginimage.jpeg?raw=true')
        no-repeat center center;
    background-size: cover;
    filter: blur(8px);
    z-index: -2; /* Send the background behind other content */
}

header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1;
    overflow: hidden;
}

.overlay {
    position: fixed; /* Fix the overlay */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4); /* Semi-transparent overlay */
    z-index: -1; /* Overlay above the background image */
}

.container {
    position: relative;
    z-index: 0; /* Ensure content is above overlay */
    padding: 20px;
}

.card-container .card {
    margin-bottom: 20px;
}

/* Optional custom shadow */
.card-custom-shadow {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
    /* Adjust the values for your desired shadow */
}

.status-scheduled {
    background-color: #ffc107; /* Warning color */
}

.status-completed {
    background-color: #28a745; /* Success color */
}

.status-canceled {
    background-color: #dc3545; /* Danger color */
}

.btn {
    margin-right: 5px;
}

.btn.disabled {
    cursor: not-allowed;
}

.btn-participant {
    font-size: 0.9rem;
    padding: 0.375rem 0.75rem;
}

/* Custom CSS for alignment */
.filter-container {
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.filter-container .form-select {
    margin-right: 10px;
}
</style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    <br>
    <br>
    <br>
    <br>
    <!-- Container for the button and dropdown -->
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-6">
                <%-- <!-- Link to go back to the meeting creation form -->
                <p class="text-center">
                    <a href="<c:url value='/employee/meeting/create' />" class="btn btn-primary"> 
                        <i class="fas fa-calendar-plus"></i> Create Another Meeting 
                    </a>
                </p> --%>
            </div>
            <div class="col-md-6">
                <!-- Dropdown for filtering -->
                <form id="filterForm" method="get" action="<c:url value='/employee/meeting/filter' />">
                    <input type="hidden" name="creatorId" value="${param.creatorId}" />
                    <div class="form-floating">
                        <select name="status" class="form-select" aria-label="Filter meetings" onchange="submitFilterForm()">
                            <option value="" <c:if test="${empty selectedStatus}">selected</c:if>>All Meetings</option>
                            <option value="Scheduled" <c:if test="${selectedStatus == 'Scheduled'}">selected</c:if>>Scheduled</option>
                            <option value="Completed" <c:if test="${selectedStatus == 'Completed'}">selected</c:if>>Completed</option>
                            <option value="Canceled" <c:if test="${selectedStatus == 'Canceled'}">selected</c:if>>Canceled</option>
                        </select>
                        <label for="floatingSelect">Filter by Meeting Status</label>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="card-container">
            <h2 style="text-align: center; margin: 0; padding: 20px 0; color:white;">Find All Your Meetings Here</h2>
            <br>
            <div class="row">
                <c:forEach var="entry" items="${meetingsMap}">
                    <c:set var="meeting" value="${entry.key}" />
                    <c:set var="isCreator" value="${entry.value}" />
                    <c:set var="isCompleted" value="${meeting.meetingStatus eq 'Completed'}" />
                    <c:set var="isCanceled" value="${meeting.meetingStatus eq 'Canceled'}" />
                    <c:url var="updateLink" value="/meeting/${meeting.meetingId}/edit" />
                    <c:url var="addParticipantsLink" value="/employees/names">
                        <c:param name="meetingId" value="${meeting.meetingId}" />
                    </c:url>
                    <div class="col-md-4">
                        <div class="card card-custom-shadow">
                            <div class="card-header" style="background-color: ${meeting.meetingStatus eq 'Scheduled' ? '#ffc107' : (meeting.meetingStatus eq 'Completed' ? '#28a745' : (meeting.meetingStatus eq 'Canceled' ? '#dc3545' : '#ffffff'))};">
                                <b style="display: flex; justify-content: center; align-items: center; height: 100%; text-align: center;">${meeting.meetingStatus}</b>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title" style="display: flex; justify-content: center; align-items: center; height: 100%; text-align: center;">${meeting.meetingTitle}</h4>
                                <p class="card-text">
                                    <strong>Meeting ID:</strong> ${meeting.meetingId}<br> <strong>Start Time:</strong> ${meeting.meetingStartTime}<br> <strong>End Time:</strong> ${meeting.meetingEndTime}<br> <strong>Created On:</strong> ${meeting.meetingCreatedOn}<br> <strong>Type:</strong> ${meeting.meetingType}<br>
                                </p>
                                <div class="d-flex justify-content-center">
                                    <c:if test="${isCreator and not isCompleted and not isCanceled}">
                                        <a href="${updateLink}" class="btn btn-warning"> 
                                            <i class="fas fa-edit"></i> Edit 
                                        </a>
                                        <a href="${addParticipantsLink}" class="btn btn-primary btn-participant"> 
                                            <i class="fas fa-user-plus"></i> Participant 
                                        </a>
                                    </c:if>
                                    <c:if test="${!isCreator or isCompleted or isCanceled}">
                                        <button class="btn btn-secondary ${isCompleted or isCanceled ? 'disabled' : ''}">
                                            <i class="fas fa-edit"></i> Edit
                                        </button>
                                        <button class="btn btn-secondary btn-participant ${isCompleted or isCanceled ? 'disabled' : ''}">
                                            <i class="fas fa-user-plus"></i> Participant
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS (optional, for any interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIqNpQ8XfK4C+2L4a7Bz6rb/v/0g1qzvFA9Q2LwqWwA7EzF6F2T" crossorigin="anonymous"></script>
    <!-- JavaScript to submit form on dropdown change -->
    <script>
        function submitFilterForm() {
            document.getElementById('filterForm').submit();
        }
    </script>
</body>
</html>