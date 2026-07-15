package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Course;
import service.DataStore;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String duration = request.getParameter("duration");
        double fee = Double.parseDouble(request.getParameter("fee"));

        Course course = new Course(id, name, duration, fee);
        DataStore.courses.add(course);

        response.sendRedirect("courses.jsp");
    }
}