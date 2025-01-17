import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CourseServlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String dbURL = "jdbc:mysql://localhost:3306/university_db";
        String dbUsername = "root";
        String dbPassword = "password";
        return DriverManager.getConnection(dbURL, dbUsername, dbPassword);
    }

    // Display courses to students
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = getConnection();
            String query = "SELECT * FROM courses";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("courses", rs); // Pass the result set to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("courses.jsp");
            dispatcher.forward(request, response);

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
