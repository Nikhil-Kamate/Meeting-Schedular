<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Meeting</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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

        .overlay {
            position: fixed; /* Fix the overlay */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Semi-transparent overlay */
            z-index: -1; /* Overlay above the background image */
        }

        .card {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            max-width: 600px; /* Adjust width as needed */
            padding: 2rem; /* Adjust padding to match spacing */
            border-radius: 0.8rem;
            background: #fff; /* White background for form */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for better separation */
        }

        .form-floating {
            width: 100%; /* Make form fields full width of container */
        }

        .form-floating input, .form-floating textarea, .form-floating select {
            width: 100%; /* Ensure input fields fit within their container */
        }

        .form-floating.mb-3 {
            margin-bottom: 1rem; /* Adjust bottom margin for spacing */
        }

        .text-center button {
            width: 100%; /* Make button same width as fields */
            margin-top: 1rem; /* Add margin for spacing */
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    <div class="card">
        <h1 class="text-center mb-4">Edit Meeting</h1>
        <form action="${pageContext.request.contextPath}/meeting/${meeting.meetingId}/update" method="post">
            <!-- Hidden fields to pass creatorId and status -->
            <input type="hidden" name="creatorId" value="${creatorId}" />
            <input type="hidden" name="status" value="${status}" />
            
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingTitle" name="meetingTitle" value="${meeting.meetingTitle}" required placeholder="Title">
                <label for="floatingTitle">Title</label>
            </div>
            <div class="form-floating mb-3">
                <textarea class="form-control" id="floatingDescription" name="meetingDescription" rows="3" required placeholder="Description">${meeting.meetingDescription}</textarea>
                <label for="floatingDescription">Description</label>
            </div>
            <div class="form-floating mb-3">
                <input type="datetime-local" class="form-control" id="floatingStartTime" name="meetingStartTime" value="${meeting.meetingStartTime}" required>
                <label for="floatingStartTime">Start Time</label>
            </div>
            <div class="form-floating mb-3">
                <input type="datetime-local" class="form-control" id="floatingEndTime" name="meetingEndTime" value="${meeting.meetingEndTime}" required>
                <label for="floatingEndTime">End Time</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingType" name="meetingType" value="${meeting.meetingType}" required placeholder="Type">
                <label for="floatingType">Type</label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingStatus" name="meetingStatus" value="${meeting.meetingStatus}" required placeholder="Status">
                <label for="floatingStatus">Status</label>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Update Meeting</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS (Optional, for interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-LzK6z9F5vDY6+eK2ytJ0zdO6G6QwZbP0QwPflYw0ZT1/2YUk8z5toFz39evAtXK" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-w76A4m3o5hdZ5N7FgpKK6+kYJ6AO57I6hv5f9rDzO8jRmcQeU4Jb+gfZ3mLE77/g" crossorigin="anonymous"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const now = new Date().toISOString().slice(0, 16); // Get current date and time in ISO format
            document.getElementById('floatingStartTime').setAttribute('min', now);
            document.getElementById('floatingEndTime').setAttribute('min', now);
        });
    </script>
</body>
</html>
