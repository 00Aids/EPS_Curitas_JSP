<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Date"%>  <!-- Importa java.sql.Date para manejar la conversión -->

<%
    // Obtener los parámetros del formulario
    String idExamen = request.getParameter("idExamen");
    String tipoExamen = request.getParameter("tipo_examen");
    String fechaExamen = request.getParameter("fecha_examen");

    Connection conexion = null;
    PreparedStatement sentencia = null;

    try {
        Class.forName("org.postgresql.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // Cambia a tu base de datos
            "postgres", 
            "12345"
        );

        // Convertir la fecha a tipo java.sql.Date
        Date fechaSQL = Date.valueOf(fechaExamen);

        // Crear la consulta SQL para actualizar los datos del examen
        String consultaSQL = "UPDATE examenes SET tipo_examen = ?, fecha_examen = ? WHERE id_examen = ?";
        sentencia = conexion.prepareStatement(consultaSQL);
        sentencia.setString(1, tipoExamen);
        sentencia.setDate(2, fechaSQL);  // Usar el valor convertido de la fecha
        sentencia.setInt(3, Integer.parseInt(idExamen));

        int filas = sentencia.executeUpdate();

        if (filas > 0) {
            // Redirigir a la página de visualización de exámenes
            response.sendRedirect("verExamenes.jsp");
        } else {
            out.println("<div class='alert alert-danger'>No se pudo actualizar el examen. Verifique el ID.</div>");
        }

    } catch (ClassNotFoundException e) {
        out.println("Error en la carga del driver: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Error accediendo a la base de datos: " + e.getMessage());
    } finally {
        if (sentencia != null) {
            try {
                sentencia.close();
            } catch (SQLException e) {
                out.println("Error cerrando la sentencia: " + e.getMessage());
            }
        }
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                out.println("Error cerrando la conexión: " + e.getMessage());
            }
        }
    }
%>
