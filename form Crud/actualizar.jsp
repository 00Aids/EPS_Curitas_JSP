<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Date"%>

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
        String email = request.getParameter("email");
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
            String consultaSQL = "SELECT * FROM formulario WHERE email='" + email + "'";
            rs = sentencia.executeQuery(consultaSQL);

            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String password = rs.getString("password");
                String genero = rs.getString("genero");
                Date fechaNacimiento = rs.getDate("fecha_nacimiento");
                String direccion = rs.getString("direccion");
    %>
                <form action="actualizar_procesar.jsp" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="email" value="<%= email %>">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                    </div>
                    <div class="form-group">
                        <label for="genero">Genero:</label>
                        <div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="male" value="male" <%= genero.equals("male") ? "checked" : "" %>>
                                <label class="form-check-label" for="male">Masculino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="female" value="female" <%= genero.equals("female") ? "checked" : "" %>>
                                <label class="form-check-label" for="female">Femenino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="genero" id="others" value="others" <%= genero.equals("others") ? "checked" : "" %>>
                                <label class="form-check-label" for="others">Otros</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                        <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" value="<%= fechaNacimiento %>" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Direccion:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" value="<%= direccion %>" required>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="mostrar.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
    <%
            } else {
                out.println("<div class='alert alert-danger'>No se encontró un registro con el email proporcionado.</div>");
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
