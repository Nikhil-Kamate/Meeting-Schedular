<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery and Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    justify-content: center;
}

.card {
    width: 18rem; /* Adjust width as needed */
}

.disabled {
    color: red;
}

.container {
    margin-top: 100px; /* Adjust to avoid overlap with fixed header */
}

.btn-center {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
</style>
<script>
function validateForm() {
    var checkboxes = document.querySelectorAll('input[name="participants"]:checked');
    if (checkboxes.length === 0) {
        // Show Bootstrap modal
        $('#exampleModal').modal('show');
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="empheader.jsp"></jsp:include>
    </header><br>
    <div class="container">
        <!-- Align "Back to Meeting List" and search field in one row -->
        <div class="row mb-3">
            <div class="col-md-6">
               <%--  <a href="${pageContext.request.contextPath}/employee/meeting/filterByCreator?creatorId=${sessionScope.loggedInEmployee.employeeId}" class="btn btn-primary">Back to Meeting List</a> --%>
            </div>
            <div class="col-md-6">
                <!-- Search Form with floating label style -->
                <form action="${pageContext.request.contextPath}/employees/search" method="get" class="d-flex">
                    <input type="hidden" name="meetingId" value="${meetingId}" />
                    <div class="form-floating flex-grow-1">
                        <input type="text" id="searchName" name="name" class="form-control" placeholder="Search by Name" value="${searchName}">
                        <label for="searchName">Search by Name</label>
                    </div>
                    <button type="submit" class="btn btn-primary ms-2">Search</button>
                </form>
            </div>
        </div>
        <br><br>
		<h3 style="text-align: center; color: white;">Add Participants</h3>
		<br>
        <!-- Form to add participants -->
        <form
            action="${pageContext.request.contextPath}/employee/meeting/addParticipants"
            method="post"
            onsubmit="return validateForm();">
            <!-- Include the meeting ID in a hidden field -->
            <input type="hidden" name="meetingId" value="${meetingId}" />

            <div class="card-container">
                <c:forEach var="employee" items="${employees}">
                    <div class="card">
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${employee.notAvailable}">
                                    <input type="checkbox" disabled="disabled"/> 
                                    <h5 class="card-title">
                                        <span class="disabled"><i class="fas fa-user-tie card-icon"></i> ${employee.empFirstName} ${employee.empLastName} - Not Available</span>
                                    </h5>
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="participants" value="${employee.employeeId}"> Select here </input>
                                    <h5 class="card-title" style="color:green;"><i class="fas fa-user-tie card-icon"></i> ${employee.empFirstName} ${employee.empLastName}</h5>
                                </c:otherwise>
                            </c:choose>
                            <p class="card-text">Department : ${employee.empDepartment } <br> Email : ${employee.empEmail}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Center the "Add Participants" button -->
            <div class="btn-center">
                <input type="submit" value="Add Participants" class="btn btn-success">
            </div>
        </form>
    </div>

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Attention</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            Please add people to the meeting by selecting at least one participant.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>

</body>
</html>
