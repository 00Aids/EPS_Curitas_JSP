<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.sql.Date"%>

<%
    String email = request.getParameter("email");
    String nombre = request.getParameter("nombre");
    String password = request.getParameter("password");
    String genero = request.getParameter("genero");
    String fechaNacimientoStr = request.getParameter("fecha_nacimiento");
    String direccion = request.getParameter("direccion");

    LocalDate fechaNacimientoLocalDate = LocalDate.parse(fechaNacimientoStr);
    Date fechaNacimiento = Date.valueOf(fechaNacimientoLocalDate);

    Connection conexion = null;
    Statement sentencia = null;

    try {
        Class.forName("org.postgresql.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Quiz", 
            "postgres", 
            "123455"
        );

        sentencia = conexion.createStatement();
        String consultaSQL = "UPDATE formulario SET nombre='" + nombre + "', password='" + password + "', genero='" + genero + "', fecha_nacimiento='" + fechaNacimiento + "', direccion='" + direccion + "' WHERE email='" + email + "'";
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
                out.println("Error cerrando la conexión: " + e.getMessage());
            }
        }
    }
%>