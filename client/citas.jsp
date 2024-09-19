<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EPS Curitas - Solicitud de Citas</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #e9f7ef;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            background-color: #f0fdf4;
        }
        .card-header {
            background-color: #28a745;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            margin-top: 15px;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-secondary {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            margin-top: 15px;
            background-color: #6c757d;
        }
        .footer {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
        }
        .card-body {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="text-center mb-4">Solicitudes</h1>

    <div class="row">
        <!-- Card para solicitar cita médica -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-header">
                    Solicitar Cita Médica
                </div>
                <div class="card-body">
                    <form action="citasMedicas/solicitarCita.jsp" method="post" class="needs-validation" novalidate>
                        <button type="submit" class="btn btn-primary">Solicitar Cita</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Card para solicitar exámenes de laboratorio -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-header">
                    Solicitar Exámenes de Laboratorio
                </div>
                <div class="card-body">
                    <form action="Examen/solicitarLaboratorio.jsp" method="post" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="tipo_examen">Tipo de Examen:</label>
                            <input type="text" class="form-control" id="tipo_examen" name="tipo_examen" required>
                            <div class="invalid-feedback">Por favor ingrese el tipo de examen.</div>
                        </div>

                        <div class="form-group">
                            <label for="fecha_examen">Fecha de solicitud:</label>
                            <input type="date" class="form-control" id="fecha_examen" name="fecha_examen" required>
                            <div class="invalid-feedback">Por favor seleccione una fecha.</div>
                        </div>

                        <button type="submit" class="btn btn-primary">Solicitar Examen</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Card para actualizar datos personales -->
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-header">
                    Actualizar Datos Personales
                </div>
                <div class="card-body">
                    <form action="DatosPersonales/actualizarPerfil.jsp" method="post" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="campo_id">(Inmodificable) Cédula:</label>
                            <input type="text" class="form-control" id="campo_id" name="cedula" placeholder="Cédula" value="<%= session.getAttribute("cedula") %>" readonly required>
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
                            <label for="campo_telefono">Teléfono:</label>
                            <input type="text" class="form-control" id="campo_telefono" name="telefono" placeholder="Teléfono" required>
                        </div>

                        <div class="form-group">
                            <label for="campo_email">Correo Electrónico:</label>
                            <input type="email" class="form-control" id="campo_email" name="email" placeholder="Correo Electrónico" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Actualizar Datos</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Botones de navegación -->
    <div class="row mb-4">
        <div class="col-md-4">
            <a href="citasMedicas/verCitas.jsp" class="btn btn-secondary">Ver Citas</a>
        </div>
        <div class="col-md-4">
            <a href="Examen/verExamenes.jsp" class="btn btn-secondary">Ver Exámenes</a>
        </div>
        <div class="col-md-4">
            <a href="DatosPersonales/datosPersonales.jsp" class="btn btn-secondary">Ver datos Personales</a>
        </div>
        <div class="col-md-4"></div>
            <a href="../index.jsp" class="btn btn-secondary">Inicio</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>EPS Curitas | Desarrollado por Johan Cristancho 1097782087</p>
    <p>00Aids github</p>
</footer>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Validación del formulario Bootstrap
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

</body>
</html>
