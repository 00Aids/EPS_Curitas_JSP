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
            // Cargar el driver de PostgreSQL
            Class.forName("org.postgresql.Driver");
            
            // Establecer la conexión con la base de datos
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Quiz", 
                "postgres", 
                "123455"
            );

            // Crear la sentencia SQL
            sentencia = conexion.createStatement();
            String consultaSQL = "SELECT * FROM HojaVida WHERE id=" + id;
            rs = sentencia.executeQuery(consultaSQL);

            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String cedula = rs.getString("cedula");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                String descripcion = rs.getString("descripcion");
                String experiencia = rs.getString("experiencia");
                String habilidades = rs.getString("habilidades");
    %>
                <form action="actualizar_procesar.jsp" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="<%= id %>">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" value="<%= apellido %>" required>
                    </div>
                    <div class="form-group">
                        <label for="cedula">cedula:</label>
                        <input type="text" class="form-control" id="cedula" name="cedula" value="<%= cedula %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" value="<%= telefono %>" required>
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" rows="4" required><%= descripcion %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="experiencia">Experiencia:</label>
                        <textarea class="form-control" id="experiencia" name="experiencia" rows="4" required><%= experiencia %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="habilidades">Habilidades:</label>
                        <textarea class="form-control" id="habilidades" name="habilidades" rows="4" required><%= habilidades %></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Actualizar</button>
                    <a href="mostrar.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
    <%
            } else {
                out.println("<div class='alert alert-danger'>No se encontró un registro con el ID proporcionado.</div>");
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
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>