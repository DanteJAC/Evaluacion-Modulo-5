<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<head>
    <meta charset="UTF-8">
    <title>Depositar Dinero</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            width: 100%;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        select, input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
						href="transferencias.jsp">Transferencias</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar
							Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>


    <div class="container">
        <h2>Depositar Dinero</h2>
        <form action="controlador" method="post">
            <input type="hidden" name="action" value="depositar">
            <div>
                <label for="origen">Cuenta de origen:</label>
                <select id="origen" name="origen">
                    <option value="admin">admin</option>
                    <option value="admin1">admin1</option>
                    <!-- Agrega más opciones según sea necesario -->
                </select>
            </div>
            <div>
                <label for="monto">Monto a depositar:</label>
                <input type="number" id="monto" name="monto" step="0.01" required>
            </div>
            <div>
                <input type="submit" value="Depositar">
            </div>
            <div>
    <a href="bienvenido.jsp" class="btn btn-alert btn-back" style="border-radius: 20px; text-align: center; margin-left: 200px; background-color: fuchsia;">Volver</a>
</div>
        </form>
    </div>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
    
</body>
</html>
