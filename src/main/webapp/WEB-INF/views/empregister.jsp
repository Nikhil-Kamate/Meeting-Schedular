<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <meta charset="UTF-8">
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

        .form-container {
            position: relative;
            z-index: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Full viewport height minus header height */
            padding-top: 80px; /* Adjust if header height changes */
        }

        .form-wrapper {
            background: #fff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 800px;
            z-index: 0;
        }

        .invalid-feedback {
            color: red;
            font-size: 0.875rem;
            display: none; /* Initially hidden */
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="hrheader.jsp"></jsp:include>
    </header><br><br><br><br>
    <div class="form-container">
        <div class="form-wrapper">
            <h2 class="text-center mb-4">Employee Registration</h2>
            <form id="registrationForm" action="<c:url value='/employee/registeremployee' />" method="post">
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empFirstName" name="empFirstName" placeholder="First Name" required>
                            <label for="empFirstName">First Name</label>
                            <div id="firstNameFeedback" class="invalid-feedback">First Name must be between 3 and 20 characters.</div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empLastName" name="empLastName" placeholder="Last Name" required>
                            <label for="empLastName">Last Name</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="empEmail" name="empEmail" placeholder="Email" required>
                            <label for="empEmail">Email</label>
                            <div id="emailFeedback" class="invalid-feedback">Please enter a valid email address (e.g., name@domain.com).</div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="empPassword" name="empPassword" placeholder="Password" required>
                            <label for="empPassword">Password</label>
                            <div id="passwordFeedback" class="invalid-feedback">Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, and one number.</div>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empDepartment" name="empDepartment" placeholder="Department">
                            <label for="empDepartment">Department</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empPhoneNumber" name="empPhoneNumber" placeholder="Phone Number">
                            <label for="empPhoneNumber">Phone Number</label>
                            <div id="phoneNumberFeedback" class="invalid-feedback">Phone Number must be a 10-digit number starting with 6, 7, 8, or 9.</div>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="empIsManager" name="empIsManager" aria-label="Is Manager" required>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                        <label for="empIsManager">Is Manager</label>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="empManagerName" name="empManagerName" aria-label="Select Manager">
                            <option value="">Select Manager</option>
                            <c:forEach var="manager" items="${managerNames}">
                                <option value="${manager}">${manager}</option>
                            </c:forEach>
                        </select>
                        <label for="empManagerName">Manager</label>
                    </div><br>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="active" name="active" aria-label="Active" required>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                        <label for="active">Active</label>
                    </div>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-primary" value="Register Employee">
                </div>
            </form>
        </div>
    </div>

    <script>
        function hideAllFeedback() {
            const feedbackElements = document.querySelectorAll('.invalid-feedback');
            feedbackElements.forEach(element => {
                element.style.display = 'none';
            });
        }

        function validateField(field, pattern, feedbackElement, message) {
            field.addEventListener('focus', function() {
                hideAllFeedback(); // Hide all feedback messages on focus
                feedbackElement.style.display = 'none'; // Hide feedback message on focus
            });

            field.addEventListener('input', function() {
                if (!pattern.test(field.value)) {
                    feedbackElement.textContent = message;
                    feedbackElement.style.display = 'block'; // Show feedback message if invalid
                } else {
                    feedbackElement.textContent = '';
                    feedbackElement.style.display = 'none'; // Hide feedback message if valid
                }
            });
        }

        const firstNameField = document.getElementById('empFirstName');
        const firstNameFeedback = document.getElementById('firstNameFeedback');
        validateField(firstNameField, /^.{3,20}$/, firstNameFeedback, 'First Name must be between 3 and 20 characters.');

        const emailField = document.getElementById('empEmail');
        const emailFeedback = document.getElementById('emailFeedback');
        validateField(emailField, /^[^\s@]+@[^\s@]+\.[^\s@]+$/, emailFeedback, 'Please enter a valid email address (e.g., name@domain.com).');

        const passwordField = document.getElementById('empPassword');
        const passwordFeedback = document.getElementById('passwordFeedback');
        validateField(passwordField, /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/, passwordFeedback, 'Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, and one number.');

        const phoneNumberField = document.getElementById('empPhoneNumber');
        const phoneNumberFeedback = document.getElementById('phoneNumberFeedback');
        validateField(phoneNumberField, /^[6789]\d{9}$/, phoneNumberFeedback, 'Phone Number must be a 10-digit number starting with 6, 7, 8, or 9.');
    </script>
</body>
</html>
