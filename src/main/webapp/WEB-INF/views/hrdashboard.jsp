<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body, html {
        height: 100%;
        margin: 0;
        overflow: hidden; /* Hide scrollbars */
    }
    .background-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://github.com/Nikhil-Kamate/Photo/blob/master/loginimage.jpeg?raw=true') no-repeat center center;
        background-size: cover;
        filter: blur(8px);
        z-index: -1; /* Send the background behind other content */
    }
    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4); /* Semi-transparent overlay */
        z-index: 0; /* Overlay above the background image */
    }
    .card-container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Full viewport height */
        padding: 20px;
        z-index: 1; /* Ensure cards are above the overlay */
        position: relative;
    }
    .card {
        width: 22rem; /* Card width */
        margin: 10px; /* Reduced margin to minimize space */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .card:hover {
        transform: scale(1.05); /* Slightly enlarge the card */
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6); /* Increase the shadow */
    }
    .card-icon {
        font-size: 3rem;
        display: block;
        margin: 0 auto;
        padding: 20px;
    }
    .row {
        margin: 40px; /* Remove default row margin */
    }
    .col-md-6 {
        display: flex;
        justify-content: center; /* Centering columns */
    }
</style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="hrheader.jsp"></jsp:include>
    </header>
   
    <div class="card-container">
    <h2 style="color:white; text-align:center;">Welcome Back!</h2>
        <div class="container">
         
            <!-- First Row -->
            <div class="row">
            
                <div class="col-md-6 d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-user-tie card-icon" style="color: green;"></i>
                            <h5 class="card-title">Employee Management</h5>
                            <p class="card-text">Manage employee records.</p>
                            <a href="${pageContext.request.contextPath}/employee/registerempform" class="btn btn-primary">Add Employee</a>
                        </div>
                    </div>
                </div>
               <%--  <div class="col-md-6 d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-calendar-plus card-icon" style="color: orange;"></i>
                            <h5 class="card-title">Meeting Scheduling</h5>
                            <p class="card-text">Schedule meetings seamlessly.</p>
                            <a href="${pageContext.request.contextPath}/meeting/create" class="btn btn-primary">Create Meeting</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Second Row -->
            <div class="row mt-4">
                <div class="col-md-4 d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-calendar-alt card-icon" style="color: #007bff;"></i>
                            <h5 class="card-title">Event Coordination</h5>
                            <p class="card-text">Coordinate and track events easily.</p>
                            <a href="<c:url value='/calendar/view'/>" class="btn btn-primary">View Calendar</a>
                        </div>
                    </div>
                </div> --%>
                <div class="col-md-6 d-flex justify-content-center">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-users card-icon" style="color: #17a2b8;"></i>
                            <h5 class="card-title">View All Employees</h5>
                            <p class="card-text">View a list of all employees.</p>
                            <a href="${pageContext.request.contextPath}/employee/listallemployee" class="btn btn-primary">View All Employees</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
