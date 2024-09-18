<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    String id = request.getParameter("id");
    String direccion = request.getParameter("direccion");
    String link_maps = request.getParameter("link_maps");

    Connection conexion = null;
    Statement sentencia = null;

    try {
        Class.forName("org.postgresql.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1", 
            "postgres", 
            "12345"
        );

        sentencia = conexion.createStatement();
        String consultaSQL = "UPDATE ubicacion SET direccion='" + direccion + "', link_maps='" + link_maps + "' WHERE id=" + id;
        int filas = sentencia.executeUpdate(consultaSQL);

        response.sendRedirect("mostrar.jsp");

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
                out.println("Error cerrando la conexion: " + e.getMessage());
            }
        }
    }
%>