package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Attendance;
import service.DataStore;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "add";
        }

        switch (action) {
            case "add":
                addAttendance(request, response);
                break;
            case "update":
                updateAttendance(request, response);
                break;
            case "delete":
                deleteAttendance(request, response);
                break;
            default:
                response.sendRedirect("attendance.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {
            deleteAttendance(request, response);
        } else {
            response.sendRedirect("attendance.jsp");
        }
    }

    private void addAttendance(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");

        Attendance attendance = new Attendance(id, studentId, courseId, date, status, remarks);
        DataStore.attendanceRecords.add(attendance);

        response.sendRedirect("attendance.jsp?success=Attendance record added successfully");
    }

    private void updateAttendance(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String studentId = request.getParameter("studentId");
        String courseId = request.getParameter("courseId");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");

        // Find and update the attendance record
        for (Attendance a : DataStore.attendanceRecords) {
            if (a.getId().equals(id)) {
                a.setStudentId(studentId);
                a.setCourseId(courseId);
                a.setDate(date);
                a.setStatus(status);
                a.setRemarks(remarks);
                break;
            }
        }

        response.sendRedirect("attendance.jsp?success=Attendance record updated successfully");
    }

    private void deleteAttendance(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        // Find and remove the attendance record
        DataStore.attendanceRecords.removeIf(a -> a.getId().equals(id));

        response.sendRedirect("attendance.jsp?success=Attendance record deleted successfully");
    }
}