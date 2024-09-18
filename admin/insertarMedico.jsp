<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String especialidad = request.getParameter("especialidad");
    String telefono = request.getParameter("telefono");

    Connection conexion = null;
    PreparedStatement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // URL de la base de datos
            "postgres",                                    // Usuario de la BD
            "12345"                                        // Contraseña de la BD
        );

        // Crear la consulta SQL para insertar los datos
        String consultaSQL = "INSERT INTO medicos (nombre, especialidad, telefono) VALUES (?, ?, ?)";

        // Usar PreparedStatement para evitar inyecciones SQL
        sentencia = conexion.prepareStatement(consultaSQL);
        sentencia.setString(1, nombre);
        sentencia.setString(2, especialidad);
        sentencia.setString(3, telefono);

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate();

        // Redirigir a la página de visualización o éxito
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
