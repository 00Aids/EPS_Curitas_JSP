<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%

    String cedula = (String) session.getAttribute("cedula");
    if (cedula == null) {
        // Si no hay cedula en la sesión, redirigir al login
        response.sendRedirect("login.jsp");
        return;
    }

    // Obtener los parámetros del formulario
    String estadoAfiliado = request.getParameter("estadoAfiliado");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");


    Connection conexion = null;
    PreparedStatement sentencia = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1",  // URL de la base de datos
            "postgres",                                  // Usuario de la BD
            "12345"                                       // Contraseña de la BD
        );

        // Crear la consulta SQL para actualizar los datos del usuario con la cedula como clave
        String consultaSQL = "UPDATE usuarios SET estadoafiliado = ?, telefono = ?, email = ? WHERE cedula = ?";

        // Usar PreparedStatement para evitar inyecciones SQL
        sentencia = conexion.prepareStatement(consultaSQL);
        sentencia.setString(1, estadoAfiliado);
        sentencia.setString(2, telefono);
        sentencia.setString(3, email);
        sentencia.setString(4, cedula);  // La cedula es la clave para actualizar

        // Ejecutar la consulta
        int filas = sentencia.executeUpdate();

        if (filas > 0) {
            // Redirigir a la página de éxito o mostrar mensaje de éxito
            response.sendRedirect("citas.jsp?mensaje=actualizado");
        } else {
            out.println("No se pudo actualizar la información.");
        }

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
