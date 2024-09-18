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
    <title>Actualizar Examen</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Actualizar Examen</h1>

    <%
        String idExamen = request.getParameter("id");
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet rs = null;

        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/Parcial1",  // Cambia por tu base de datos
                "postgres", 
                "12345"
            );

            sentencia = conexion.createStatement();
            String consultaSQL = "SELECT * FROM examenes WHERE id_examen=" + idExamen;
            rs = sentencia.executeQuery(consultaSQL);

            if (rs.next()) {
                String tipoExamen = rs.getString("tipo_examen");
                String fechaExamen = rs.getString("fecha_examen");
                String cedula = rs.getString("cedula");
    %>
                <form action="actualizar_procesar.jsp" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="idExamen" value="<%= idExamen %>">

                    <div class="form-group">
                        <label for="tipo_examen">Tipo de Examen:</label>
                        <input type="text" class="form-control" id="tipo_examen" name="tipo_examen" value="<%= tipoExamen %>" required>
                    </div>

                    <div class="form-group">
                        <label for="fecha_examen">Fecha de Examen:</label>
                        <input type="date" class="form-control" id="fecha_examen" name="fecha_examen" value="<%= fechaExamen %>" required>
                    </div>

                    <!-- Mostrar la cedula como un campo de solo lectura (no editable) -->
                    <div class="form-group">
                        <label for="cedula">cedula:</label>
                        <input type="text" class="form-control" id="cedula" name="cedula" value="<%= cedula %>" readonly>
                    </div>

                    <button type="submit" class="btn btn-success">Actualizar Examen</button>
                    <a href="verExamenes.jsp" class="btn btn-secondary">Cancelar</a>
                </form>
    <%
            } else {
                out.println("<div class='alert alert-danger'>No se encontró un examen con el ID proporcionado.</div>");
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
