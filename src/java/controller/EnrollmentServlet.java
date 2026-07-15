package controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Enrollment;
import service.DataStore;

@WebServlet("/EnrollmentServlet")
public class EnrollmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");

        Enrollment enrollment = new Enrollment(
                studentId,
                courseId,
                LocalDate.now().toString()
        );

        DataStore.enrollments.add(enrollment);

        response.sendRedirect("enrollment.jsp");
    }

}