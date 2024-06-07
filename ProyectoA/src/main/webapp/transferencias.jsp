<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Realizar Transferencia</title>


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
	max-width: 600px;
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

.btn-primary {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: green
	}
.btn-container {
	border-radius: 20px;
   text-align: center;
	margin-left: 700px;
	margin-right: 700px;
	background-color: fuchsia;
}

.btn:hover {
	background-color: #4cae4c;
}

.error-message {
	color: red;
	text-align: center;
}


.btn-back {
	display: block;
	margin-top: 20px;
	text-align: center;
}


.navbar {
	background-color: #e3f2fd;
}

.navbar a {
	color: #333;
}

@media ( max-width : 768px) {
	.container {
		margin-top: 10px;
		margin-bottom: 10px;
		padding: 10px;
	}
	h2 {
		margin-top: 10px;
		margin-bottom: 20px;
	}

}

.btn-container {
	text-align: center;
	margin-left: 700px;
	margin-right: 700px;
	color: red;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="bienvenido.jsp">Inicio</a></li>
					<li class="nav-item"><a class="nav-link"
						href="deposito.jsp">Depositos</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar
							Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h2>Transferencias</h2>
		<form action="controlador" method="post">
			<div class="form-group">
				<label for="origen">Cuenta de Origen:</label> <select id="origen"
					name="origen" class="form-select">
					<option value="admin">admin</option>
					<option value="admin1">admin1</option>


				</select>
			</div>
			<div class="form-group">
				<label for="destino">Cuenta de Destino:</label> <select id="destino"
					name="destino" class="form-select">
					<option value="admin">admin</option>
					<option value="admin1">admin1</option>


				</select>
			</div>
			<div class="form-group">
				<label for="monto">Monto:</label> <input type="text" id="monto"
					name="monto" class="form-control">
			</div>
			<input type="hidden" name="action" value="transferir"> <input
				type="submit" value="Realizar Transferencia" class="btn btn-primary">
		</form>
	</div>

	<!-- Botón para volver a bienvenido.jsp -->
	<div class="btn-container">
		<a href="bienvenido.jsp" class="btn btn-alert btn-back">Volver</a>
	</div>

	<!-- Mensaje de error -->
	<c:if test="${not empty error}">
		<p class="error-message">${error}</p>
	</c:if>

	<footer class="footer mt-auto py-3 bg-light">
		<div class="container text-center">
			<p>Todos los derechos reservados &copy;DanteJAC</p>
		</div>
	</footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>

