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
    <title>Lista de Registros</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Lista de Registros</h1>

    <%
        // Establecer la conexión con la base de datos
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet rs = null;

        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Parcial1", 
                "postgres", 
                "12345"
            );

            // Crear la sentencia SQL
            sentencia = conexion.createStatement();
            String consultaSQL = "SELECT * FROM ubicacion";
            rs = sentencia.executeQuery(consultaSQL);
    %>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>direccion</th>
                <th>link_maps</th>
            </tr>
        </thead>
        <tbody>
    <%
            while (rs.next()) {
                String direccion = rs.getString("direccion");
                String link_maps = rs.getString("link_maps");
    %>
            <tr>
                <td><%= direccion %></td>
                <td><%= link_maps %></td>
                <td>
                    <form action="eliminar.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                    <form action="actualizar.jsp" method="get" style="display:inline;">
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
            // Cerrar el ResultSet, la sentencia y la conexión
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

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>