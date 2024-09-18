<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EPS UTS - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e6f5e6; /* Fondo verde claro */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-left: 5px solid #4CAF50; /* Verde oscuro en el borde */
        }
        .card-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            color: #4CAF50; /* Verde principal */
        }
        .form-group label {
            font-weight: bold;
            color: #4CAF50; /* Verde principal */
        }
        .btn-primary {
            background-color: #4CAF50; /* Botón verde */
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #45a049; /* Verde oscuro en hover */
        }
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
        .register-link a {
            color: #4CAF50; /* Verde en los enlaces */
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <h2 class="card-title">Bienvenido a EPS UTS</h2>
                    <form action="login.jsp" method="post">
                        <div class="form-group">
                            <label for="usuario">Cedula:</label>
                            <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Ingrese su cedula/Identificacion" required>
                        </div>
                        <div class="form-group">
                            <label for="contraseña">Contrasena:</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su contrasena" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                    <div class="register-link">
                        <a href="register/hoja_de_vida.jsp">¿No tienes Cuenta? Registrate</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
