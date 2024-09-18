<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String tipoExamen = request.getParameter("tipo_examen");
    String fechaExamen = request.getParameter("fecha_examen");

    Connection conexion = null;
    Statement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",
            "postgres", 
            "12345"
        );

        // Crear la sentencia SQL
        sentencia = conexion.createStatement();

        // Crear la consulta SQL para insertar los datos
        String consultaSQL = "INSERT INTO examenes (tipo_examen, fecha_examen) VALUES ";
        consultaSQL += "('" + tipoExamen + "', '" + fechaExamen + "')";

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate(consultaSQL);

        // Redirigir a la página de visualización de exámenes
        response.sendRedirect("mostrarExamenes.jsp");

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
