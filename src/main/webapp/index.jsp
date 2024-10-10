<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Meeting Scheduler</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
/* Navbar customizations */
.navbar {
	height: 90px; /* Increase the height */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow effect */
}

.navbar-nav .nav-link {
	font-size: 1.3rem; /* Make right-side navbar items bigger */
	font-weight: bold; /* Make them bold */
	margin-left: 20px; /* Space between nav items */
}

/* Align cards in the center and add spacing */
.card {
	margin: 15px; /* Add spacing between cards */
	text-align: center; /* Center align text */
	height: 300px; /* Increased height */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow to cards */
	border: none; /* Remove default border */
}

.card-icon {
	font-size: 4rem; /* Size of the icon */
	display: block; /* Ensure block display for alignment */
	margin: 20px auto; /* Center the icon */
}

.card-container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

/* Footer customizations */
.footer {
	background-color: #ede7f0; /* Black background color */
	height: 80px; /* Increase the footer height */
	color: #000000; /* White text color */
}

.footer .container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 100%;
}

.footer .text-center {
	margin-top: 10px; /* Add some space from the social media icons */
}

/* Carousel height adjustment */
.carousel-inner {
	height: 60vh; /* Increase the height for better fit */
}

.carousel-item img {
	height: 90vh; /* Ensure images fit within the carousel */
	object-fit: cover; /* Crop the image to fill the height */
}

</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo" style="height: 80px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#contactUsModal">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#aboutUsModal">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login/login">Login</a></li>
            </ul>
        </div>
    </div>
</nav>
	

	<!-- Contact Us Modal -->
	<div class="modal fade" id="contactUsModal" tabindex="-1"
		aria-labelledby="contactUsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="contactUsModalLabel">Contact Us</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
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
	<div class="modal fade" id="aboutUsModal" tabindex="-1"
		aria-labelledby="aboutUsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="aboutUsModalLabel">About Us</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Discover seamless scheduling with our webapplication, designed to simplify your meeting management and boost productivity</p>
					<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo" style="height: 60px;"></a>
				</div>
			</div>
		</div>
	</div>

	<!-- Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active carousal-1">
				<img
					src="https://github.com/Nikhil-Kamate/Photo/blob/master/meeting1.jpeg?raw=true" 
					alt="Logo" class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img
					src="https://github.com/Nikhil-Kamate/Photo/blob/master/meeting2.jpeg?raw=true"
					alt="Logo" class="d-block w-100">
			</div>
			<div class="carousel-item carousal-1">
				<img src="https://github.com/Nikhil-Kamate/Photo/blob/master/meeting3.jpeg?raw=true"
					alt="Logo" class="d-block w-100">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br><br>
	<div>
	<h1 style="text-align: center; margin: 0;">
  Streamline your workflow<br>
  with our all-in-one management solutions
</h1>
	
	
	</div>

	<!-- Cards -->
	<div class="container my-5 card-container">
		<!-- Employee Card -->
		<div class="card" style="width: 20rem;">
			<div class="card-body">
				<i class="fas fa-user-tie card-icon" style="color: green;"></i>
				<h5 class="card-title">Employee Management</h5>
				<p class="card-text">Efficiently manage employee records, update
					their details, and keep track of their performance. Streamline your
					HR processes with ease.</p>
			</div>
		</div>
		<!-- Meeting Card -->
		<div class="card" style="width: 20rem;">
			<div class="card-body">
				<i class="fas fa-calendar-plus card-icon" style="color: orange;"></i>
				<h5 class="card-title">Meeting Scheduling</h5>
				<p class="card-text">Schedule meetings seamlessly with our
					intuitive interface. Set up meeting times, send invites, and manage
					meeting details all in one place.</p>
			</div>
		</div>
		<!-- Scheduling Card -->
		<div class="card" style="width: 20rem;">
			<div class="card-body">
				<i class="fas fa-calendar-alt card-icon" style="color: #007bff;"></i>
				<h5 class="card-title">Event Coordination</h5>
				<p class="card-text">Coordinate and track various events and
					appointments. Ensure everything is organized and on schedule with
					our advanced scheduling tools.</p>
			</div>
		</div>
	</div>

	<footer class="footer text-center">
		<!-- Grid container -->
		<div class="container pt-4">
			<!-- Section: Social media -->
			<section class="mb-4">
				<!-- Facebook -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-facebook-f"></i></a>

				<!-- Twitter -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-twitter"></i></a>

				<!-- Google -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-google"></i></a>

				<!-- Instagram -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-instagram"></i></a>

				<!-- Linkedin -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-linkedin"></i></a>
				<!-- Github -->
				<a data-mdb-ripple-init
					class="btn btn-link btn-floating btn-lg text-body m-1" href="#!"
					role="button" data-mdb-ripple-color="dark"><i
					class="fab fa-github"></i></a>
			</section>
			<!-- Section: Social media -->
		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3" style="font-size: 1.25rem;">© 2024
			Copyright: All Right Reserved</div>

		<!-- Copyright -->
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
