import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/EnrollmentServlet")
public class EnrollmentServlet extends HttpServlet {

    // Mock database to store enrolled students
    private static final Map<String, String> enrolledStudents = new HashMap<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String studentName = request.getParameter("studentName");
        String courseName = request.getParameter("courseName");

        if (studentName == null || studentName.isEmpty() || courseName == null || courseName.isEmpty()) {
            out.println("<html><body><h3>Error: Both student name and course name are required!</h3>");
            out.println("<a href='academicManagement.html'>Go Back</a></body></html>");
            return;
        }

        synchronized (enrolledStudents) {
            if (enrolledStudents.containsKey(studentName)) {
                out.println("<html><body><h3>" + studentName + " is already enrolled in " + enrolledStudents.get(studentName) + "</h3>");
            } else {
                enrolledStudents.put(studentName, courseName);
                out.println("<html><body><h3>Successfully enrolled " + studentName + " in " + courseName + "!</h3>");
            }
        }
        out.println("<a href='academicManagement.html'>Go Back</a></body></html>");
    }
}
