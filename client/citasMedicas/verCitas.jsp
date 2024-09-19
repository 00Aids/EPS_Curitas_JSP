<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Citas Medicas</title>
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
        .table {
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            padding: 10px;
            font-size: 18px;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .footer {
            background-color: #28a745;
            color: white;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 50px;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            Mis Citas Medicas
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Medico</th>
                        <th>Fecha de Cita</th>
                        <th>Estado</th>
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

                            String buscarUsuarioSQL = "SELECT id FROM usuarios WHERE cedula = ?";
                            PreparedStatement buscarUsuarioStmt = conexion.prepareStatement(buscarUsuarioSQL);
                            buscarUsuarioStmt.setString(1, cedula);
                            ResultSet resultadoUsuario = buscarUsuarioStmt.executeQuery();

                            if (resultadoUsuario.next()) {
                                int idUsuario = resultadoUsuario.getInt("id");

                                String consultaSQL = "SELECT c.id_cita, m.nombre, c.fecha_cita, c.estado " +
                                                    "FROM citas c " +
                                                    "JOIN medicos m ON c.id_medico = m.id " +
                                                    "WHERE c.id_usuario = ?";
                                sentencia = conexion.prepareStatement(consultaSQL);
                                sentencia.setInt(1, idUsuario);
                                rs = sentencia.executeQuery();

                                while (rs.next()) {
                                    int idCita = rs.getInt("id_cita");
                                    String nombreMedico = rs.getString("nombre");
                                    java.sql.Date fechaCita = rs.getDate("fecha_cita");
                                    String estado = rs.getString("estado");

                                    out.println("<tr>");
                                    out.println("<td>" + idCita + "</td>");
                                    out.println("<td>" + nombreMedico + "</td>");
                                    out.println("<td>" + fechaCita + "</td>");
                                    out.println("<td>" + estado + "</td>");
                                    out.println("</tr>");
                                }
                            } else {
                                out.println("<tr><td colspan='4'>No se encontro el usuario con la cedula proporcionada.</td></tr>");
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

<!-- Footer -->
<footer class="footer">
    <p>EPS Curitas | Desarrollado por Johan Cristancho 1097782087</p>
    <p>00Aids github</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
