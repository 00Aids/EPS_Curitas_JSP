<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String direccion = request.getParameter("direccion");
    String link_maps = request.getParameter("link_maps");


    Connection conexion = null;
    Statement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Quiz", 
            "postgres", 
            "123455"
        );

        // Crear la sentencia SQL
        sentencia = conexion.createStatement();

        // Crear la consulta SQL para insertar los datos
        String consultaSQL = "INSERT INTO ubicacion (direccion, link_maps) VALUES ";
        consultaSQL += "('" + direccion + "', '" + link_maps + "')";

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate(consultaSQL);

        // Redirigir a la página de visualización de datos
        response.sendRedirect("mostrar.jsp");

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