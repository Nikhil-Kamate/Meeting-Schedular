<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Dashboard</title>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
body, html {
    height: 100%;
    margin: 0;
    overflow: hidden; /* Hide scrollbars */
    color: #fff; /* White text color */
    font-family: Arial, sans-serif; /* Font styling */
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
    text-align: center; /* Center text inside cards */
}
.card-wrapper {
    display: flex;
    justify-content: center; /* Center cards horizontally */
    gap: 20px; /* Space between cards */
    flex-wrap: wrap; /* Allow cards to wrap to the next line if necessary */
    margin-bottom: 20px; /* Space below cards */
}
.card {
    background: #fff; /* White background for cards */
    color: #000; /* Black text color */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
    width: 22rem; /* Card width */
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
}
.card:hover {
    transform: scale(1.05); /* Slightly enlarge the card */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6); /* Increase the shadow */
}
.card-icon {
    font-size: 3rem; /* Adjust icon size */
    display: block;
    margin-bottom: 15px;
}
.card-title {
    margin: 10px 0;
    font-size: 20px;
}
.card-text {
    margin-bottom: 20px;
    font-size: 16px;
}
.btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    text-decoration: none;
    color: #fff;
    background-color: #007BFF; /* Bootstrap primary color */
    border-radius: 5px;
    transition: background-color 0.3s ease;
}
.btn:hover {
    background-color: #0056b3; /* Darker shade on hover */
}
h2, p {
    color: #fff; /* White color for text */
}
</style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header>
    
    <div class="card-container">
        <h2>Hello, ${sessionScope.loggedInEmployee.empFirstName} ${sessionScope.loggedInEmployee.empLastName}!</h2>
        <p>Organize your meetings for a productive day!</p>

        <div class="card-wrapper">
            <div class="card">
                <i class="fas fa-calendar-plus card-icon" style="color: #28a745;"></i> <!-- Icon for creating a meeting -->
                <h5 class="card-title"><a href="${pageContext.request.contextPath}/employee/meeting/create" style="text-decoration: none; color: #000;">Create a New Meeting</a></h5>
                <p style="color: black;">Schedule a new meeting with ease.</p>
                <a href="${pageContext.request.contextPath}/employee/meeting/create" class="btn btn-primary">Go to Form</a>
            </div>

            <div class="card">
                <i class="fas fa-calendar-check card-icon" style="color: #17a2b8;"></i> <!-- Icon for viewing meetings -->
                <h5 class="card-title"><a href="${pageContext.request.contextPath}/employee/meeting/filterByCreator?creatorId=${sessionScope.loggedInEmployee.employeeId}" style="text-decoration: none; color: #000;">View All Meetings</a></h5>
                <p style="color: black;">View and manage all your meetings.</p>
                <a href="${pageContext.request.contextPath}/employee/meeting/filterByCreator?creatorId=${sessionScope.loggedInEmployee.employeeId}" class="btn btn-primary">View Meetings</a>
            </div>

            <div class="card">
                <i class="fas fa-calendar card-icon" style="color: #ffc107;"></i> <!-- Icon for viewing calendar -->
                <h5 class="card-title"><a href="${pageContext.request.contextPath}/employee/calendar" style="text-decoration: none; color: #000;">View Calendar</a></h5>
                <p style="color: black;">Access your calendar and view upcoming events.</p>
                <a href="${pageContext.request.contextPath}/employee/meeting/meetingdetails?creatorId=${sessionScope.loggedInEmployee.employeeId}" class="btn btn-primary">Open Calendar</a>
            </div>
        </div>
    </div>
</body>
</html>
