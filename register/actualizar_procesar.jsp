<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String cedula = request.getParameter("cedula");
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String descripcion = request.getParameter("descripcion");
    String experiencia = request.getParameter("experiencia");
    String habilidades = request.getParameter("habilidades");

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
        String consultaSQL = "UPDATE HojaVida SET nombre='" + nombre + "', apellido='" + apellido + "', cedula='" + cedula + "', email='" + email + "', telefono='" + telefono + "', descripcion='" + descripcion + "', experiencia='" + experiencia + "', habilidades='" + habilidades + "' WHERE id=" + id;
        
        // Ejecutar la consulta
        int filas = sentencia.executeUpdate(consultaSQL);

        // Redirigir a la página de visualización de registros
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