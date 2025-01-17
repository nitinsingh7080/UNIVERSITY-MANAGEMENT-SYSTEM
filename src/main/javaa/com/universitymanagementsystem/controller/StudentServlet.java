import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class StudentServlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String dbURL = "jdbc:mysql://localhost:3306/university_db";
        String dbUsername = "root";
        String dbPassword = "password";
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }

    // Student Registration
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        try {
            Connection conn = getConnection();
            String query = "INSERT INTO students (name, email, password, department) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, department);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page if registration fails
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    // Student Login
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = getConnection();
            String query = "SELECT * FROM students WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // User found, redirect to the student dashboard
                response.sendRedirect("student_dashboard.jsp");
            } else {
                // Invalid credentials, redirect back to login
                response.sendRedirect("login.jsp?error=true");
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}