<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Registro</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Actualizar Registro</h1>

    <%
        String id = request.getParameter("id");
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet rs = null;

        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Quiz", 
                "postgres", 
                "123455"
            );

            sentencia = conexion.createStatement();
            String consultaSQL = "SELECT * FROM ubicacion WHERE id=" + id;
            rs = sentencia.executeQuery(consultaSQL);

            if (rs.next()) {
                String direccion = rs.getString("direccion");
                String link_maps = rs.getString("link_maps");
    %>
                <form action="actualizar_procesar.jsp" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%= id %>">
                    <div class="form-group">
                        <label for="nombre">direccion:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" value="<%= direccion %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="porque">link_maps:</label>
                        <textarea class="form-control" id="link_maps" name="link_maps" rows="4" required><%= link_maps %></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="mostrar.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
    <%
            } else {
                out.println("<div class='alert alert-danger'>No se encontro un registro con el ID proporcionado.</div>");
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
                    out.println("<div class='alert alert-danger'>Error cerrando la conexion: " + e.getMessage() + "</div>");
                }
            }
        }
    %>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>