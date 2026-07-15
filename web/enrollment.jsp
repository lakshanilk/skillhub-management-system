<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.Enrollment, service.DataStore, model.Student, model.Course" %>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<Enrollment> enrollments = DataStore.enrollments;
    ArrayList<Student> students = DataStore.students;
    ArrayList<Course> courses = DataStore.courses;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Enrollments - SkillHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/theme.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp">
                <i class="bi bi-mortarboard"></i> SkillHub Training
            </a>
            <div class="d-flex align-items-center">
                <a href="dashboard.jsp" class="btn btn-outline-light btn-sm me-2">
                    <i class="bi bi-house"></i> Dashboard
                </a>
                <a href="LogoutServlet" class="btn btn-outline-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-4">
        <h2 class="page-title">
            <i class="bi bi-journal"></i> Enrollment Management
        </h2>
        <hr>
        
        <div class="card card-custom mb-4">
            <div class="card-header-custom">
                <i class="bi bi-plus-circle"></i> New Enrollment
            </div>
            <div class="card-body">
                <form action="EnrollmentServlet" method="post">
                    <div class="row g-2">
                        <div class="col-md-5">
                            <select class="form-select form-select-custom" name="studentId" required>
                                <option value="">Select Student</option>
                                <% for(Student s : students) { %>
                                    <option value="<%= s.getId() %>"><%= s.getId() %> - <%= s.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col-md-5">
                            <select class="form-select form-select-custom" name="courseId" required>
                                <option value="">Select Course</option>
                                <% for(Course c : courses) { %>
                                    <option value="<%= c.getId() %>"><%= c.getId() %> - <%= c.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-highlight-custom w-100">
                                <i class="bi bi-plus"></i> Enroll
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="card card-custom">
            <div class="card-header-custom">
                <i class="bi bi-table"></i> Enrollment Records
                <span class="badge bg-light float-end text-dark"><%= enrollments.size() %> Enrollments</span>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-custom">
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Course ID</th>
                                <th>Enrollment Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (enrollments.isEmpty()) { %>
                                <tr><td colspan="3" class="text-center text-muted">No enrollments found</td></tr>
                            <% } else { %>
                                <% for(Enrollment e : enrollments) { %>
                                    <tr>
                                        <td><strong><%= e.getStudentId() %></strong></td>
                                        <td><%= e.getCourseId() %></td>
                                        <td><%= e.getDate() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="dashboard.jsp" class="btn btn-secondary-custom">
                <i class="bi bi-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
    
    <div class="footer-custom mt-4">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 SkillHub Training Academy</p>
        </div>
    </div>
</body>
</html>