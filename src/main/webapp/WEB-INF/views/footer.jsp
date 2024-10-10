<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        .footer {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #4543ca;
        }
        .footer .left {
            display: flex;
            align-items: center;
        }
        .footer .left img {
            height: 60px;
            margin-right: 20px;
        }
        .footer .right {
            display: flex;
            align-items: center;
        }
        .footer .right a {
            margin-left: 20px;
            color: #333;
            text-decoration: none;
            font-size: 34px;
        }
        .footer .right a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
	 <footer class="footer">
        <div class="left">
            <img src="https://github.com/Nikhil-Kamate/Photo/blob/master/logo2.jpeg?raw=true" alt="Logo">
            <span style="font-size: 20px;">© 2024 Company, Inc</span>
        </div>
        <div class="right">
            <a href="https://twitter.com" title="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="https://instagram.com" title="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="https://facebook.com" title="Facebook"><i class="fab fa-facebook-f"></i></a>
        </div>
    </footer>
</body>
</html>