<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Admin Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="icon" href="path/to/your/favicon.ico" type="image/x-icon">
<style>
    .navbar {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        height: 80px; /* Adjust the height */
    }
    .navbar-brand img {
        height: 80px; /* Adjust the logo height */
    }
    .navbar-text {
        margin-left: 20px; /* Add space between text links and other elements */
    }
    .navbar-text a {
        font-weight: bold;
        text-decoration: none; /* Remove underline */
        color: #000; /* Adjust the color as needed */
    }
    .navbar-text a:hover {
        text-decoration: underline; /* Underline on hover, if desired */
    }
    .navbar-text-logout a {
        font-weight: bold;
        color: red; /* Correct property for text color */
        text-decoration: none;
    }
    .navbar-text-logout a:hover {
        text-decoration: underline; /* Underline on hover, if desired */
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo">
            </a>
            <div class="d-flex ms-auto align-items-center">
                <span class="navbar-text mx-3">
                    <a href="${pageContext.request.contextPath}/login/dashboard">HR Dashboard</a>
                </span>
                <span class="navbar-text mx-3">
                	<a href="${pageContext.request.contextPath}/employee/registerempform">Add Employee</a>
                </span>
                <span class="navbar-text mx-3">
                	<a href="${pageContext.request.contextPath}/employee/listallemployee">Employees List</a>
                </span>
                <span class="navbar-text-logout mx-3">
                    <a href="${pageContext.request.contextPath}/login/logout">Logout</a>
                </span>
                
            </div>
        </div>
    </nav>
</body>
</html>
