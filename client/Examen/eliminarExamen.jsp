<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener el ID del examen que se quiere eliminar
    int idExamen = Integer.parseInt(request.getParameter("id"));

    Connection conexion = null;
    Statement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // Cambia esto por el nombre correcto de tu base de datos
            "postgres", 
            "12345"
        );

        // Crear la sentencia SQL para eliminar el examen
        sentencia = conexion.createStatement();
        String consultaSQL = "DELETE FROM public.examenes WHERE id_examen = " + idExamen;

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate(consultaSQL);

        if (filas > 0) {
            // Si se eliminó correctamente, redirigir a la página de visualización
            response.sendRedirect("verExamenes.jsp");
        } else {
            out.println("<div class='alert alert-danger'>No se pudo eliminar el examen.</div>");
        }

    } catch (ClassNotFoundException e) {
        out.println("Error cargando el driver: " + e.getMessage());
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
