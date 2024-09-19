<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Formulario para ingresar datos como en una hoja de vida"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Hoja de vida</title>
    <style>
        body {
            background-color: #f0f2f5;
        }
        .card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
            color: #495057;
        }
        .form-control {
            border-radius: 10px;
            padding: 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.25);
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-radius: 10px;
            padding: 10px 20px;
        }
        h1 {
            font-size: 2.5rem;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .card {
            border-left: 5px solid #28a745;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="container mt-3">
        <h1 class="text-center">Registrarse</h1>
    </header>
    
    <!-- Formulario -->
    <div class="container mt-5">
        <div class="card">
            <form action="insertarClientes.jsp" method="post">
                <div class="form-group">
                    <label for="campo_nombre">Nombre:</label>
                    <input type="text" class="form-control" id="campo_nombre" name="nombre" placeholder="Nombre" required>
                </div>
                <div class="form-group">
                    <label for="campo_apellido">Apellido:</label>
                    <input type="text" class="form-control" id="campo_apellido" name="apellido" placeholder="Apellido" required>
                </div>
                <div class="form-group">
                    <label for="campo_id">Cedula:</label>
                    <input type="text" class="form-control" id="campo_id" name="cedula" placeholder="Cedula" required>
                </div>
                <div class="form-group">
                    <label for="campo_email">Correo Electrónico:</label>
                    <input type="email" class="form-control" id="campo_email" name="email" placeholder="Correo Electrónico" required>
                </div>
                <div class="form-group">
                    <label for="campo_telefono">Teléfono:</label>
                    <input type="text" class="form-control" id="campo_telefono" name="telefono" placeholder="Telefono" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <div class="form-group">
                    <label for="campo_ciudad">Ciudad:</label>
                    <textarea class="form-control" id="campo_ciudad" name="ciudad" placeholder="Coloca ciudad de residencia" maxlength="200" required></textarea>
                </div>
                <div class="form-group">
                    <label>Tipo de Afiliado:</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="tipoAfiliado" id="contributivo" value="contributivo" required>
                        <label class="form-check-label" for="contributivo">Contributivo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="tipoAfiliado" id="subsidiado" value="subsidiado" required>
                        <label class="form-check-label" for="subsidiado">Subsidiado</label>
                    </div>
                </div>
                <div class="form-group">
                    <label>Estado Afiliado:</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="estadoAfiliado" id="activo" value="activo" required>
                        <label class="form-check-label" for="activo">Activo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="estadoAfiliado" id="inactivo" value="inactivo" required>
                        <label class="form-check-label" for="inactivo">Inactivo</label>
                    </div>
                </div>
                <div class="form-group">
                    <label>Rol:</label><br>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="cliente" value="cliente" required>
                        <label class="form-check-label" for="cliente">Cliente</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="rol" id="admin" value="admin" required>
                        <label class="form-check-label" for="admin">Administrador</label>
                    </div>
                </div>

                <!-- Botones -->
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
            <div class="mt-3">
                <a href="../indexAdmin.jsp" class="btn btn-secondary">Login</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
