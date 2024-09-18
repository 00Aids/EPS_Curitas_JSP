<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.sql.Date"%>

<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email"); 
    String password = request.getParameter("password");
    String genero = request.getParameter("genero");
    String fechaNacimientoStr = request.getParameter("fecha_nacimiento");
    String direccion = request.getParameter("direccion");

    // Convertir fecha de String a java.sql.Date
    LocalDate fechaNacimientoLocalDate = LocalDate.parse(fechaNacimientoStr);
    Date fechaNacimiento = Date.valueOf(fechaNacimientoLocalDate);

    out.println("Fecha de nacimiento: " + fechaNacimiento);

    Connection conexion = null;
    Statement sentencia = null;

    int filas = 0;

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
        String consultaSQL = "INSERT INTO formulario (nombre, email, password, genero, fecha_nacimiento, direccion) VALUES ";
        consultaSQL += "('" + nombre + "', '" + email + "', '" + password + "', '" + genero + "', '" + fechaNacimiento + "', '" + direccion + "')";

        // Ejecutar la consulta
        filas = sentencia.executeUpdate(consultaSQL);

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