<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
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

        .btn-row {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    <div class="form-container">
        <div class="form-wrapper">
            <h2 class="text-center mb-4">Edit Employee</h2>
            <form action="<c:url value='/employee/update/${employee.employeeId}' />" method="post">
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empFirstName" name="empFirstName" value="${employee.empFirstName}" placeholder="First Name" readonly>
                            <label for="empFirstName">First Name</label>
                            <div id="firstNameFeedback" class="invalid-feedback">First Name must be between 3 and 20 characters.</div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empLastName" name="empLastName" value="${employee.empLastName}" placeholder="Last Name" readonly>
                            <label for="empLastName">Last Name</label>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="empEmail" name="empEmail" value="${employee.empEmail}" placeholder="Email" readonly>
                            <label for="empEmail">Email</label>
                            <div id="emailFeedback" class="invalid-feedback">Please enter a valid email address (e.g., name@domain.com).</div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="empPassword" name="empPassword" value="${employee.empPassword}" placeholder="Password" readonly>
                            <label for="empPassword">Password</label>
                            <div id="passwordFeedback" class="invalid-feedback">Password must be at least 8 characters long, include at least one uppercase letter, one lowercase letter, and one number.</div>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-3">
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empDepartment" name="empDepartment" value="${employee.empDepartment}" placeholder="Department">
                            <label for="empDepartment">Department</label>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="empPhoneNumber" name="empPhoneNumber" value="${employee.empPhoneNumber}" placeholder="Phone Number">
                            <label for="empPhoneNumber">Phone Number</label>
                            <div id="phoneNumberFeedback" class="invalid-feedback">Phone Number must be a 10-digit number starting with 6, 7, 8, or 9.</div>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="empIsManager" name="empIsManager" aria-label="Is Manager" required>
                            <option value="yes" <c:if test="${employee.empIsManager == 'yes'}">selected</c:if>>Yes</option>
                            <option value="no" <c:if test="${employee.empIsManager == 'no'}">selected</c:if>>No</option>
                        </select>
                        <label for="empIsManager">Is Manager</label>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="empManagerName" name="empManagerName" aria-label="Select Manager">
                            <option value="">Select Manager</option>
                            <c:forEach var="manager" items="${managerNames}">
                                <option value="${manager}" <c:if test="${manager == employee.empManagerName}">selected</c:if>>${manager}</option>
                            </c:forEach>
                        </select>
                        <label for="empManagerName">Manager</label>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="form-floating">
                        <select class="form-select" id="active" name="active" aria-label="Active" required>
                            <option value="yes" <c:if test="${employee.active == 'yes'}">selected</c:if>>Yes</option>
                            <option value="no" <c:if test="${employee.active == 'no'}">selected</c:if>>No</option>
                        </select>
                        <label for="active">Active</label>
                    </div>
                </div>
                <div class="btn-row">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="<c:url value='/employee/listallemployee' />" class="btn btn-secondary">Back to List</a>
                </div>
            </form>
        </div>
    </div>

	<!-- Bootstrap JS (optional, for any interactive components) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pzjw8f+ua7Kw1TIqNpQ8XfK4C+2L4a7Bz6rb/v/0g1qzvFA9Q2LwqWwA7EzF6F2T"
		crossorigin="anonymous"></script>
</body>
</html>
s