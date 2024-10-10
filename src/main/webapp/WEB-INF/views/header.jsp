<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meeting Scheduler</title>
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
    .navbar-nav .nav-link {
        font-size: 1.25rem; /* Increase font size */
        font-weight: bold; /* Make text bold */
        margin-right: 15px; /* Reduce space between links */
    }
    .modal-title {
        font-size: 1.5rem; /* Larger font size for modal titles */
        font-weight: bold; /* Bold text for modal titles */
    }
    .modal-header .modal-icon {
        font-size: 1.5rem; /* Larger icon size */
        margin-right: 10px; /* Space between icon and title */
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#contactUsModal">
                           </i> <b>Contact Us</b>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#aboutUsModal">
                             <b>About Us</b>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contact Us Modal -->
    <div class="modal fade" id="contactUsModal" tabindex="-1" aria-labelledby="contactUsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="contactUsModalLabel">
                        <i class="fas fa-envelope modal-icon"></i> Contact Us
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Nikhil Kamate</p>
					<p>Email- nikhilkamate115@gmail.com</p>
					<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo" style="height: 60px;"></a>
                </div>
            </div>
        </div>
    </div>

    <!-- About Us Modal -->
    <div class="modal fade" id="aboutUsModal" tabindex="-1" aria-labelledby="aboutUsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="aboutUsModalLabel">
                        <i class="fas fa-info-circle modal-icon"></i> About Us
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   <p>Discover seamless scheduling with our app, designed to simplify your meeting management and boost productivity</p>
					<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo" style="height: 60px;"></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
