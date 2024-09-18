<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar Cita</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="text-center mb-4">Insertar Cita</h1>
    <%
        String fechaCita = request.getParameter("fecha_cita");
        String idMedico = request.getParameter("medico");
        int idUsuario = -1;  // Inicializamos el idUsuario con un valor que indica no encontrado

        // Obtener la cedula desde la sesión
        String cedula = (String) session.getAttribute("cedula");
        if (cedula == null) {
            // Si no hay cedula en la sesión, redirigir a la página principal (citas.jsp)
            response.sendRedirect("citas.jsp");
            return;
        }

        Connection conexion = null;
        PreparedStatement sentencia = null;
        ResultSet rs = null;

        try {
            // Cargar el driver de PostgreSQL
            Class.forName("org.postgresql.Driver");

            // Establecer la conexión con la base de datos
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Parcial1",
                "postgres",
                "12345"
            );

            // Obtener el ID del usuario basado en la cedula
            String sqlBuscarUsuario = "SELECT id FROM usuarios WHERE cedula = ?";
            sentencia = conexion.prepareStatement(sqlBuscarUsuario);
            sentencia.setString(1, cedula); // Usar la cedula de la sesión
            rs = sentencia.executeQuery();

            if (rs.next()) {
                idUsuario = rs.getInt("id"); // Asignar el id del usuario obtenido
            } else {
                out.println("<div class='alert alert-danger'>No se encontró un usuario con la cedula proporcionada.</div>");
            }

            // Si se encontró el usuario, proceder a insertar la cita
            if (idUsuario != -1) {
                // Crear la consulta SQL para insertar la cita
                String sqlInsert = "INSERT INTO citas (id_usuario, id_medico, fecha_cita, estado) VALUES (?, ?, ?, ?)";
                sentencia = conexion.prepareStatement(sqlInsert);
                sentencia.setInt(1, idUsuario);  // ID del usuario obtenido
                sentencia.setInt(2, Integer.parseInt(idMedico));  // ID del Medico seleccionado
                sentencia.setDate(3, java.sql.Date.valueOf(fechaCita));  // Fecha de la cita
                sentencia.setString(4, "pendiente");  // Estado inicial de la cita

                // Ejecutar la inserción
                int filasInsertadas = sentencia.executeUpdate();

                if (filasInsertadas > 0) {
                    out.println("<div class='alert alert-success'>¡Cita médica solicitada con éxito!</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Error al solicitar la cita.</div>");
                }
            }

        } catch (ClassNotFoundException e) {
            out.println("<div class='alert alert-danger'>Error cargando el driver: " + e.getMessage() + "</div>");
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Error accediendo a la base de datos: " + e.getMessage() + "</div>");
        } finally {
            // Cerrar la conexión y los recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error cerrando el ResultSet: " + e.getMessage() + "</div>");
                }
            }
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
    %>
    <a href="citas.jsp" class="btn btn-primary">Volver al inicio</a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
