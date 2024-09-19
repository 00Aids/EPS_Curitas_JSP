<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos del Usuario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f4f3;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            padding: 30px;
            border: none;
        }
        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
            font-weight: bold;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            Datos Personales del Usuario
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Campo</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conexion = null;
                        PreparedStatement sentencia = null;
                        ResultSet rs = null;
                        String cedula = (String) session.getAttribute("cedula");

                        if (cedula == null) {
                            response.sendRedirect("citas.jsp");
                            return;
                        }

                        try {
                            Class.forName("org.postgresql.Driver");
                            conexion = DriverManager.getConnection(
                                "jdbc:postgresql://localhost:5432/Parcial1",
                                "postgres", "12345"
                            );

                            String consultaSQL = "SELECT nombre, apellido, email, telefono, ciudad, tipoafiliado, estadoafiliado, rol FROM usuarios WHERE cedula = ?";
                            sentencia = conexion.prepareStatement(consultaSQL);
                            sentencia.setString(1, cedula);
                            rs = sentencia.executeQuery();

                            if (rs.next()) {
                                String nombre = rs.getString("nombre");
                                String apellido = rs.getString("apellido");
                                String email = rs.getString("email");
                                String telefono = rs.getString("telefono");
                                String ciudad = rs.getString("ciudad");
                                String tipoAfiliado = rs.getString("tipoafiliado");
                                String estadoAfiliado = rs.getString("estadoafiliado");
                                String rol = rs.getString("rol");

                                out.println("<tr><td>Nombre</td><td>" + nombre + "</td></tr>");
                                out.println("<tr><td>Apellido</td><td>" + apellido + "</td></tr>");
                                out.println("<tr><td>Cedula</td><td>" + cedula + "</td></tr>");
                                out.println("<tr><td>Email</td><td>" + email + "</td></tr>");
                                out.println("<tr><td>Telefono</td><td>" + telefono + "</td></tr>");
                                out.println("<tr><td>Ciudad</td><td>" + ciudad + "</td></tr>");
                                out.println("<tr><td>Tipo de Afiliado</td><td>" + tipoAfiliado + "</td></tr>");
                                out.println("<tr><td>Estado de Afiliado</td><td>" + estadoAfiliado + "</td></tr>");
                                out.println("<tr><td>Rol</td><td>" + rol + "</td></tr>");
                            } else {
                                out.println("<tr><td colspan='2'>No se encontraron datos para la cedula proporcionada.</td></tr>");
                            }

                        } catch (ClassNotFoundException e) {
                            out.println("Error en la carga del driver: " + e.getMessage());
                        } catch (SQLException e) {
                            out.println("Error accediendo a la base de datos: " + e.getMessage());
                        } finally {
                            if (rs != null) {
                                try { rs.close(); } catch (SQLException e) { out.println("Error cerrando ResultSet: " + e.getMessage()); }
                            }
                            if (sentencia != null) {
                                try { sentencia.close(); } catch (SQLException e) { out.println("Error cerrando la sentencia: " + e.getMessage()); }
                            }
                            if (conexion != null) {
                                try { conexion.close(); } catch (SQLException e) { out.println("Error cerrando la conexion: " + e.getMessage()); }
                            }
                        }
                    %>
                </tbody>
            </table>
            <a href="/Parcial_practico/client/citas.jsp" class="btn btn-primary">Volver al inicio</a>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
