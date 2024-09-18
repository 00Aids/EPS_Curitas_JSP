<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina del Administrador</title>
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
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Pagina del Administrador</h1>

    <div class="row">
        <!-- Carta para CRUD Medicos -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Crear CRUD Medicos</h5>
                    <p class="card-text">Gestiona el CRUD para los medicos del sistema.</p>
                    <a href="crudMedicos.jsp" class="btn btn-primary">Acceder</a>
                </div>
            </div>
        </div>

        <!-- Carta para Crear Clientes -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Crear Clientes</h5>
                    <p class="card-text">Registra y gestiona clientes en el sistema.</p>
                    <a href="crearClientes.jsp" class="btn btn-primary">Acceder</a>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4 text-center">
        <a href="../index.jsp" class="btn btn-secondary">Inicio</a>
    </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
