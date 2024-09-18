<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
    String cedula = request.getParameter("cedula");
    String password = request.getParameter("password");

    Connection conexion = null;
    PreparedStatement sentencia = null;
    ResultSet resultado = null;

    try {
        // Cargar el driver de PostgreSQL
        Class.forName("org.postgresql.Driver");

        // Establecer la conexión con la base de datos
        conexion = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/Parcial1", 
            "postgres", 
            "12345"
        );

        // Consulta para verificar el usuario y obtener el rol
        String consultaSQL = "SELECT rol FROM usuarios WHERE cedula = ? AND password = ?";
        sentencia = conexion.prepareStatement(consultaSQL);
        sentencia.setString(1, cedula);
        sentencia.setString(2, password);

        resultado = sentencia.executeQuery();

        if (resultado.next()) {
            // Obtener el rol del usuario
            String rol = resultado.getString("rol");

            // Guardar la cedula en la sesión
            session.setAttribute("cedula", cedula);

            if ("cliente".equals(rol)) {
                response.sendRedirect("client/citas.jsp");
            } else if ("admin".equals(rol)) {
                response.sendRedirect("admin/indexAdmin.jsp");
            } else {
                out.println("Rol no reconocido.");
            }
        } else {
            out.println("Usuario o contraseña incorrectos.");
        }

    } catch (ClassNotFoundException e) {
        out.println("Error en la carga del driver: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Error accediendo a la base de datos: " + e.getMessage());
    } finally {
        // Cerrar la conexión y el resultado
        if (resultado != null) resultado.close();
        if (sentencia != null) sentencia.close();
        if (conexion != null) conexion.close();
    }
%>
