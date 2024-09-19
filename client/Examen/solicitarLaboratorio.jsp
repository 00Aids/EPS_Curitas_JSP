<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitar Examen de Laboratorio</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Solicitar Examen de Laboratorio</h1>

    <%
        // Verificar si el método de solicitud es POST
        if ("POST".equalsIgnoreCase(request.getMethod())) {

            // Obtener la cedula desde la sesión
            String cedula = (String) session.getAttribute("cedula");
            if (cedula == null) {
                // Si no hay cedula en la sesión, redirigir al login
                response.sendRedirect("../citas.jsp");
                return;
            }

            // Obtener los parámetros del formulario
            String tipoExamen = request.getParameter("tipo_examen");
            String fechaExamen = request.getParameter("fecha_examen");

            // Verificar que los campos no estén vacíos
            if (tipoExamen == null || tipoExamen.isEmpty() || fechaExamen == null || fechaExamen.isEmpty()) {
                out.println("<div class='alert alert-danger'>Por favor complete todos los campos del formulario.</div>");
            } else {
                // Conexión a la base de datos
                Connection conexion = null;
                Statement sentencia = null;

                try {
                    // Cargar el driver de PostgreSQL
                    Class.forName("org.postgresql.Driver");

                    // Establecer la conexión con la base de datos
                    conexion = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/Parcial1", // Cambiar el nombre de la base de datos si es necesario
                        "postgres", 
                        "12345"
                    );

                    // Crear la sentencia SQL
                    sentencia = conexion.createStatement();

                    // Consulta SQL para insertar los datos en la tabla examenes
                    String consultaSQL = "INSERT INTO examenes (tipo_examen, fecha_examen, cedula) VALUES ";
                    consultaSQL += "('" + tipoExamen + "', '" + fechaExamen + "', '" + cedula + "')";

                    // Ejecutar la consulta
                    int filas = sentencia.executeUpdate(consultaSQL);

                    if (filas > 0) {
                        // Mostrar mensaje de éxito
                        out.println("<div class='alert alert-success'>Examen solicitado exitosamente.</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>No se pudo solicitar el examen. Intente nuevamente.</div>");
                    }

                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Error en la carga del driver: " + e.getMessage() + "</div>");
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error accediendo a la base de datos: " + e.getMessage() + "</div>");
                } finally {
                    // Cerrar la sentencia y la conexión
                    if (sentencia != null) {
                        try {
                            sentencia.close();
                        } catch (SQLException e) {
                            out.println("<div class='alert alert-danger'>Error cerrando la sentencia: " + e.getMessage() + "</div>");
                        }
                    }
                    if (conexion != null) {
                        try {
                            conexion.close();
                        } catch (SQLException e) {
                            out.println("<div class='alert alert-danger'>Error cerrando la conexión: " + e.getMessage() + "</div>");
                        }
                    }
                }
            }
        }
    %>

    <div class="text-center mt-4">
        <a href="verExamenes.jsp" class="btn btn-primary">Ver Exámenes Solicitados</a>
        <a href="../citas.jsp" class="btn btn-secondary">Regresar</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
