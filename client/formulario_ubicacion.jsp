<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Pasatiempos</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Envia tu Ubicacion</h1>

    <form action="insertar.jsp" method="post" class="needs-validation" novalidate>
        <div class="form-group">
            <label for="nombre">Ubicacion con texto:</label>
            <input type="text" class="form-control" id="direccion" name="direccion" required>
        </div>

        <div class="form-group">
            <label for="porque">link google maps</label>
            <textarea class="form-control" id="link_maps" name="link_maps" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Enviar</button>

        <div class="mt-3">
            <a href="mostrar.jsp" class="btn btn-secondary">Ver Registros</a>
        
            <a href="../index.jsp" class="btn btn-secondary">Inicio</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>