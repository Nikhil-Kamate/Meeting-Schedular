<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    /* Your existing styles */
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
    body, html {
        margin: 0;
        padding: 0;
        height: 100vh;
        overflow: hidden;
    }
    .outer-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        padding: 20px;
        position: relative;
        z-index: 1; /* Ensure this is above the background and overlay */
    }
    .inner-container {
        display: flex;
        align-items: center;
        max-width: 1200px;
        width: 100%;
        background: white; /* Background for the container */
        border-radius: 15px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
        position: relative; /* Ensure it's above the background and overlay */
    }
    .left-section {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .left-section img {
        max-width: 100%;
        height: auto;
        border-radius: 15px;
    }
    .right-section {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .login-container {
        /* Remove background, border-radius, and box-shadow */
        padding: 40px;
        width: 100%;
        max-width: 400px;
    }
    .logo {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .logo img {
        max-width: 200px;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .alert {
        display: none;
    }
    .alert.show {
        display: block;
    }
</style>
</head>
<body>
    <div class="background-image"></div>
    <div class="overlay"></div>
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>

    <div class="outer-container">
        <div class="inner-container">
            <div class="left-section">
                <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/loginpic.jpeg?raw=true" alt="Left Image">
            </div>
            <div class="right-section">
                <div class="login-container">
                    <div class="logo">
                        <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo">
                    </div>
                    <h2 class="text-center">Login</h2>
                    <form action="${pageContext.request.contextPath}/login/login" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingUsername" name="username" placeholder="Username" required>
                            <label for="floatingUsername">Username/Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </div>
                        <c:choose>
                            <c:when test="${not empty error}">
                                <div class="alert alert-danger text-center show">${error}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-danger text-center hidden"></div>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
    window.onload = function() {
        var error = "${error}";
        var alertBox = document.querySelector('.alert');
        if (error) {
            alertBox.classList.add('show');
        } else {
            alertBox.classList.remove('show');
        }
    };
</script>   
</body>
</html>
