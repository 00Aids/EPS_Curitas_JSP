<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    
<div class="container mt-5">
    <h1 class="text-center">Formulario de Registro</h1>
    <form action="insertar.jsp" method="post">
        <div class="form-group">
            <label for="nombre">Nombre Completo:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        <div class="form-group">
            <label for="email">Correo Electronico:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Contrasena:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirmar Contrasena:</label>
            <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
        </div>
        <div class="form-group">
            <label>Genero:</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="genero" id="male" value="male" required>
                <label class="form-check-label" for="male">Masculino</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="genero" id="female" value="female" required>
                <label class="form-check-label" for="female">Femenino</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="genero" id="others" value="others" required>
                <label class="form-check-label" for="others">Otros</label>
            </div>
        </div>
        <div class="form-group">
            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
        </div>
        <div class="form-group">
            <label for="direccion">Direccion:</label>
            <input type="text" class="form-control" id="direccion" name="direccion" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    <div class="mt-3">
        <a href="mostrar.jsp" class="btn btn-secondary">Ver Registros</a>
        <a href="../index.jsp" class="btn btn-secondary">Inicio</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
