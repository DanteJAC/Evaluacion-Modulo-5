<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}


.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


h2 {
	color: #333;
	text-align: center;
	margin-bottom: 30px;
}


.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.btn {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #5cb85c;
	color: white;
	cursor: pointer;
}

.btn:hover {
	background-color: #4cae4c;
}


.error-message {
	color: red;
	text-align: center;
}


.card {
	width: 100%;
	border: none;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 20px;
}


.logo {
	display: block;
	margin: 0 auto;
	margin-bottom: 20px;
	width: 100px;
}


.form-text {
	text-align: center;
}


.register-link {
	text-align: center;
}
</style>

</head>
<body>
	<br>
	<br>
	<br>
	<h2>Iniciar Sesión</h2>
	<br>
	<br>
	<div class="container mt-4 col-lg-4">
		<div class="card col-sm-10">
			<div class="card-body">
				<form action="controlador" method="post">
					<div class="form-group text-center">
						<h3 class="form-text">Login</h3>
						<img src="img/download.png" alt="50" class="logo" /> <label
							class="form-text">Bienvenidos al Sistema</label>
					</div>
					<input type="hidden" name="action" value="login"> <label
						for="username">Usuario:</label> <input type="text" id="username"
						name="username"><br>
					<br> <label for="password">Contraseña:</label> <input
						type="password" id="password" name="password"><br>
					<br> <input type="submit" value="Ingresar" class="btn">
				</form>
			</div>
		</div>
	</div>

	<c:if test="${not empty error}">
		<p class="error-message">${error}</p>
	</c:if>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>
