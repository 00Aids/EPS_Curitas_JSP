<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String cedula = request.getParameter("cedula");
    String email = request.getParameter("email");
    String telefono = request.getParameter("telefono");
    String password = request.getParameter("password");
    String ciudad = request.getParameter("ciudad");
    String tipoAfiliado = request.getParameter("tipoAfiliado");
    String estadoAfiliado = request.getParameter("estadoAfiliado");
    String rol = request.getParameter("rol");

    Connection conexion = null;
    PreparedStatement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1", 
            "postgres", 
            "12345"
        );

        // Crear la consulta SQL para insertar los datos
        String consultaSQL = "INSERT INTO usuarios (nombre, apellido, cedula, email, telefono, password, ciudad, tipoAfiliado, estadoAfiliado, rol) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Usar PreparedStatement para evitar inyecciones SQL
        sentencia = conexion.prepareStatement(consultaSQL);
        sentencia.setString(1, nombre);
        sentencia.setString(2, apellido);
        sentencia.setString(3, cedula);
        sentencia.setString(4, email);
        sentencia.setString(5, telefono);
        sentencia.setString(6, password);
        sentencia.setString(7, ciudad);
        sentencia.setString(8, tipoAfiliado);
        sentencia.setString(9, estadoAfiliado);
        sentencia.setString(10, rol);

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate();

        // Redirigir a la página de visualización de datos
        response.sendRedirect("../indexAdmin.jsp");

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
