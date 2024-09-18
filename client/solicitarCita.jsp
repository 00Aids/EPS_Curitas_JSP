<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitar Cita Médica</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9f7ef;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            padding: 30px;
            border: none;
        }
        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px;
            font-size: 18px;
            width: 100%;
        }
        .btn-danger {
            background-color: #a72828;
            border-color: #a72828;
            padding: 10px;
            font-size: 18px;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
        }
        .invalid-feedback {
            color: red;
        }
        .footer {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            Solicitar Cita Medica
        </div>
        <div class="card-body">
            <form action="insertCita.jsp" method="post" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="fecha_cita">Fecha de la cita:</label>
                    <input type="date" class="form-control" id="fecha_cita" name="fecha_cita" required>
                    <div class="invalid-feedback">Por favor seleccione una fecha.</div>
                </div>

                <div class="form-group">
                    <label for="medico">Seleccione Médico:</label>
                    <select class="form-control" id="medico" name="medico" required>
                        <option value="">Seleccione un Medico</option>
                        <%
                            Connection conexion = null;
                            PreparedStatement sentencia = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("org.postgresql.Driver");
                                conexion = DriverManager.getConnection(
                                    "jdbc:postgresql://localhost:5432/Parcial1",
                                    "postgres", "12345"
                                );

                                String consultaSQL = "SELECT id, nombre FROM medicos";
                                sentencia = conexion.prepareStatement(consultaSQL);
                                rs = sentencia.executeQuery();

                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String nombre = rs.getString("nombre");
                                    out.println("<option value=\"" + id + "\">" + nombre + "</option>");
                                }
                            } catch (ClassNotFoundException e) {
                                out.println("Error en la carga del driver: " + e.getMessage());
                            } catch (SQLException e) {
                                out.println("Error accediendo a la base de datos: " + e.getMessage());
                            } finally {
                                if (rs != null) {
                                    try { rs.close(); } catch (SQLException e) { out.println("Error cerrando ResultSet: " + e.getMessage()); }
                                }
                                if (sentencia != null) {
                                    try { sentencia.close(); } catch (SQLException e) { out.println("Error cerrando la sentencia: " + e.getMessage()); }
                                }
                                if (conexion != null) {
                                    try { conexion.close(); } catch (SQLException e) { out.println("Error cerrando la conexión: " + e.getMessage()); }
                                }
                            }
                        %>
                    </select>
                    <div class="invalid-feedback">Por favor seleccione un Medico.</div>
                </div>

                <button type="submit" class="btn btn-primary mb-4">Solicitar Cita</button>
                <br>
                <a href="citas.jsp" class="btn btn-danger">Regresar</a>
            </form>
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
