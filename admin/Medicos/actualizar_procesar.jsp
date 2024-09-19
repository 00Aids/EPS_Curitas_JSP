<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String especialidad = request.getParameter("especialidad");
    String telefono = request.getParameter("telefono");

    Connection conexion = null;
    Statement sentencia = null;

    try {
        Class.forName("org.postgresql.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // Cambia a tu base de datos
            "postgres", 
            "12345"
        );

        // Crear la consulta SQL para actualizar los datos del Medico
        sentencia = conexion.createStatement();
        String consultaSQL = "UPDATE medicos SET nombre='" + nombre + "', especialidad='" + especialidad + "', telefono='" + telefono + "' WHERE id=" + id;
        int filas = sentencia.executeUpdate(consultaSQL);

        // Redirigir a la página de listado de Medicos
        response.sendRedirect("mostrarMedicos.jsp");

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
