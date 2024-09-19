<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener el parámetro 'id' del formulario
    String id = request.getParameter("id");
    Connection conexion = null;
    Statement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // Nombre de la base de datos
            "postgres",                                   // Usuario de la base de datos
            "12345"                                       // Contraseña del usuario
        );

        // Crear la consulta SQL para eliminar el Medico según su 'id'
        sentencia = conexion.createStatement();
        String consultaSQL = "DELETE FROM medicos WHERE id=" + id;
        int filas = sentencia.executeUpdate(consultaSQL);

        // Redirigir a la página que lista los Medicos
        response.sendRedirect("mostrarMedicos.jsp");

    } catch (ClassNotFoundException e) {
        out.println("Error en la carga del driver: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Error accediendo a la base de datos: " + e.getMessage());
    } finally {
        // Cerrar la sentencia y la conexión
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
