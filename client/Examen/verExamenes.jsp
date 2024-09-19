<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Examenes Solicitados</title>
    <!-- Bootstrap CSS -->
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
            Examenes Solicitados
        </div>
        <div class="card-body">
            <%
                Connection conexion = null;
                Statement sentencia = null;
                ResultSet rs = null;
                
                // Obtener la cédula del usuario desde la sesión
                String cedulaUsuario = (String) session.getAttribute("cedula");

                try {
                    Class.forName("org.postgresql.Driver");
                    conexion = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/Parcial1", 
                        "postgres", 
                        "12345"
                    );

                    // Modificar la consulta SQL para filtrar por la cédula del usuario
                    String consultaSQL = "SELECT id_examen, tipo_examen, fecha_examen, cedula FROM public.examenes WHERE cedula = '" + cedulaUsuario + "'";
                    sentencia = conexion.createStatement();
                    rs = sentencia.executeQuery(consultaSQL);
            %>

            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Examen</th>
                        <th>Fecha de Solicitud</th>
                        <th>Cedula</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
            <%
                    while (rs.next()) {
                        int idExamen = rs.getInt("id_examen");
                        String tipoExamen = rs.getString("tipo_examen");
                        String fechaExamen = rs.getString("fecha_examen");
                        String cedula = rs.getString("cedula");
            %>
                    <tr>
                        <td><%= idExamen %></td>
                        <td><%= tipoExamen %></td>
                        <td><%= fechaExamen %></td>
                        <td><%= cedula %></td>
                        <td>
                            <form action="eliminarExamen.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= idExamen %>">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                            <form action="actualizarExamen.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= idExamen %>">
                                <button type="submit" class="btn btn-warning btn-sm">Actualizar</button>
                            </form>
                        </td>
                    </tr>
            <%
                    }
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Error cargando el driver: " + e.getMessage() + "</div>");
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error accediendo a la base de datos: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException e) {
                            out.println("Error cerrando el ResultSet: " + e.getMessage());
                        }
                    }
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
                </tbody>
            </table>

            <div class="text-center">
                <a href="../citas.jsp" class="btn btn-primary">Regresar</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>EPS Curitas | Desarrollado por Johan Cristancho 1097782087</p>
    <p>00Aids github</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
