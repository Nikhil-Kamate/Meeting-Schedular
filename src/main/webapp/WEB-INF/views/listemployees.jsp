<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* Full viewport height */
	padding: 20px; /* Padding to avoid content touching edges */
}

.table-container {
	background-color: #fff; /* White background for table container */
	border-radius: 15px; /* Rounded corners */
	padding: 20px; /* Padding inside the container */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	/* Box shadow for better appearance */
	width: 100%;
	max-width: 1200px; /* Maximum width for larger screens */
	overflow-x: auto; /* Scrollable table on smaller screens */
}

.table thead th {
	background-color: #0d6efd; /* Bootstrap primary color */
	color: white; /* Text color for contrast */
}

.active-cell {
	background-color: #28a745; /* Bootstrap green */
	color: white; /* Text color for contrast */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect */
	text-align: center; /* Center text for better appearance */
}
</style>
</head>
<body>
	<div class="background-image"></div>
	<div class="overlay"></div>
	<header>
		<jsp:include page="hrheader.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="table-container">
			<h2 style="text-align: center; margin: 0; padding: 20px 0;">Employee
				List</h2>

			<!-- Display the list of employees -->
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>Phone Number</th>
						<th>Is Manager</th>
						<th>Manager Name</th>
						<th>Active</th>
						<th>Edit</th>
						<!-- New column for edit button -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employee" items="${employees}">
						<tr>
							<td>${employee.employeeId}</td>
							<td>${employee.empFirstName}</td>
							<td>${employee.empLastName}</td>
							<td>${employee.empEmail}</td>
							<td>${employee.empDepartment}</td>
							<td>${employee.empPhoneNumber}</td>
							<td>${employee.empIsManager}</td>
							<td>${employee.empManagerName}</td>
							<td><c:choose>
									<c:when test="${employee.active == 'yes'}">
										<button class="btn btn-success btn-sm"
											style="border-radius: 20px;">Yes</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-danger btn-sm"
											style="border-radius: 20px;">No</button>
									</c:otherwise>
								</c:choose></td>
							<td><a
								href="<c:url value='/employee/edit/${employee.employeeId}' />"
								class="btn btn-warning btn-sm">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- Link to go back to the registration form -->
			<p style="text-align: center; margin: 20px 0;">
				<a href="<c:url value='/employee/registerempform' />"
					class="btn btn-primary">Register New Employee</a>
			</p>

		</div>
	</div>

	<!-- Bootstrap JS (optional, for any interactive components) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pzjw8f+ua7Kw1TIqNpQ8XfK4C+2L4a7Bz6rb/v/0g1qzvFA9Q2LwqWwA7EzF6F2T"
		crossorigin="anonymous"></script>
</body>
</html>
