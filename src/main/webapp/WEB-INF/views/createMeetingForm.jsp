<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Meeting</title>
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

.card {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: fit-content; /* Adjust width based on content */
    padding: 2rem; /* Adjust padding to match spacing */
    border-radius: 0.8rem;
    background: #fff; /* White background for form */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for better separation */
}

.form-floating {
    width: 100%; /* Make form fields 50% of container width */
    margin: auto; /* Center align the fields */
}

.form-floating input, .form-floating select {
    width: 100%; /* Ensure input fields fit within their container */
}

.form-floating.mb-3 {
    margin-bottom: 1rem; /* Adjust bottom margin for spacing */
}

.text-center button {
    width: 50%; /* Make button same width as fields */
    margin: auto; /* Center align the button */
}

.invalid-feedback {
    display: block; /* Ensure feedback is visible below the field */
}
</style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    <br><br><br>
    <div class="card">
        <h1 class="text-center mb-4">Add a New Meeting</h1>
        <form id="meetingForm" action="${pageContext.request.contextPath}/employee/meeting/create" method="post" onsubmit="return validateForm()">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingTitle" name="meetingTitle" value="${meeting.meetingTitle}" required placeholder="Title" minlength="3" maxlength="20">
                <label for="floatingTitle">Title</label>
                <div class="invalid-feedback" id="titleFeedback">
                    Title must be between 3 and 20 characters.
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingDescription" name="meetingDescription" value="${meeting.meetingDescription}" required placeholder="Description" minlength="3" maxlength="20">
                <label for="floatingDescription">Description</label>
                <div class="invalid-feedback" id="descriptionFeedback">
                    Description must be between 3 and 20 characters.
                </div>
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
                <select class="form-select" id="floatingType" name="meetingType" required>
                    <option value="" disabled selected>Select Type</option>
                    <option value="Online" ${meeting.meetingType == 'Online' ? 'selected' : ''}>Online</option>
                    <option value="Scrum" ${meeting.meetingType == 'Scrum' ? 'selected' : ''}>Scrum</option>
                </select>
                <label for="floatingType">Type</label>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Meeting</button>
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

            // Add event listeners for validation feedback
            const titleInput = document.getElementById('floatingTitle');
            const descriptionInput = document.getElementById('floatingDescription');

            titleInput.addEventListener('input', function() {
                validateField(titleInput, 'titleFeedback');
            });

            descriptionInput.addEventListener('input', function() {
                validateField(descriptionInput, 'descriptionFeedback');
            });

            function validateField(input, feedbackId) {
                const feedbackElement = document.getElementById(feedbackId);
                if (input.value.length < 3 || input.value.length > 20) {
                    input.classList.add('is-invalid');
                    feedbackElement.style.display = 'block';
                } else {
                    input.classList.remove('is-invalid');
                    feedbackElement.style.display = 'none';
                }
            }
        });

        function validateForm() {
            const startTime = document.getElementById('floatingStartTime').value;
            const endTime = document.getElementById('floatingEndTime').value;

            if (startTime === '' || endTime === '') {
                showModal('Please select both start and end times.');
                return false;
            }

            if (endTime <= startTime) {
                showModal('End time must be after the start time.');
                return false;
            }

            return true;
        }

        function showModal(message) {
            document.getElementById('modalBody').textContent = message;
            const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
            myModal.show();
        }
    </script>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Validation Error</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body" id="modalBody">
            <!-- Error messages will be displayed here -->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
