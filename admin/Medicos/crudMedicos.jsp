<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Medicos</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f7;
        }
        .card {
            background-color: #2c5d3f; /* Verde oscuro */
            color: white;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #397b58; /* Verde medio */
            border: none;
        }
        .btn-primary:hover {
            background-color: #1e4d32; /* Verde mas oscuro al pasar el mouse */
        }
        h1 {
            color: #2c5d3f; /* Verde oscuro */
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .form-group label {
            color: white; /* Color blanco para los labels */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Gestionar Medicos</h1>

    <div class="card p-4">
        <form action="insertarMedico.jsp" method="post" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="nombre">Nombre del Medico:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <div class="form-group">
                <label for="especialidad">Especialidad:</label>
                <input type="text" class="form-control" id="especialidad" name="especialidad" required>
            </div>

            <div class="form-group">
                <label for="telefono">Telefono:</label>
                <input type="text" class="form-control" id="telefono" name="telefono" required>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Guardar</button>
        </form>

        <div class="mt-4 text-center">
            <a href="mostrarMedicos.jsp" class="btn btn-secondary">Ver Medicos</a>
            <a href="../administrador.jsp" class="btn btn-secondary">Regresar</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
