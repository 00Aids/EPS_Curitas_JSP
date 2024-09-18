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
    <title>Exámenes Solicitados</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Exámenes Solicitados</h1>

    <%
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet rs = null;

        try {
            // Establecer la conexión con la base de datos
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Parcial1", // Ajustar el nombre de tu BD
                "postgres", 
                "12345"
            );

            // Crear la sentencia SQL para consultar los exámenes
            sentencia = conexion.createStatement();
            String consultaSQL = "SELECT * FROM examenes";
            rs = sentencia.executeQuery(consultaSQL);
    %>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Tipo de Examen</th>
                <th>Fecha de Solicitud</th>
            </tr>
        </thead>
        <tbody>
    <%
            while (rs.next()) {
                String tipoExamen = rs.getString("tipo_examen");
                String fechaExamen = rs.getString("fecha_examen");
    %>
            <tr>
                <td><%= tipoExamen %></td>
                <td><%= fechaExamen %></td>
                <td>
                    <form action="eliminarExamen.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                    <form action="actualizarExamen.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-warning btn-sm">Actualizar</button>
                    </form>
                </td>
            </tr>
    <%
            }
        } catch (ClassNotFoundException e) {
            out.println("<div class='alert alert-danger'>Error en la carga del driver: " + e.getMessage() + "</div>");
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger'>Error accediendo a la base de datos: " + e.getMessage() + "</div>");
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error cerrando el ResultSet: " + e.getMessage() + "</div>");
                }
            }
            if (sentencia != null) {
                try {
                    sentencia.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error cerrando la sentencia: " + e.getMessage() + "</div>");
                }
            }
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error cerrando la conexión: " + e.getMessage() + "</div>");
                }
            }
        }
    %>
        </tbody>
    </table>

    <div class="text-center">
        <a href="citas.jsp" class="btn btn-primary">Regresar</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
