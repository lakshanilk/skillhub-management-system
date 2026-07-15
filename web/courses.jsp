<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.Course, service.DataStore" %>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<Course> courses = DataStore.courses;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Courses - SkillHub</title>
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
            <i class="bi bi-book"></i> Course Management
        </h2>
        <hr>
        
        <!-- Add Course Form -->
        <div class="card card-custom mb-4">
            <div class="card-header-custom">
                <i class="bi bi-plus-circle"></i> Add New Course
            </div>
            <div class="card-body">
                <form action="CourseServlet" method="post">
                    <div class="row g-2">
                        <div class="col-md-3">
                            <input type="text" class="form-control form-control-custom" 
                                   name="id" placeholder="Course ID" required>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control form-control-custom" 
                                   name="name" placeholder="Course Name" required>
                        </div>
                        <div class="col-md-2">
                            <input type="text" class="form-control form-control-custom" 
                                   name="duration" placeholder="Duration" required>
                        </div>
                        <div class="col-md-3">
                            <input type="number" class="form-control form-control-custom" 
                                   name="fee" placeholder="Fee (LKR)" step="0.01" required>
                        </div>
                        <div class="col-md-1">
                            <button type="submit" class="btn btn-secondary-custom w-100">
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Course List -->
        <div class="card card-custom">
            <div class="card-header-custom">
                <i class="bi bi-table"></i> Course Records
                <span class="badge bg-light float-end text-dark"><%= courses.size() %> Courses</span>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Fee (LKR)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (courses.isEmpty()) { %>
                                <tr><td colspan="4" class="text-center text-muted">No courses found</td></tr>
                            <% } else { %>
                                <% for(Course c : courses) { %>
                                    <tr>
                                        <td><strong><%= c.getId() %></strong></td>
                                        <td><%= c.getName() %></td>
                                        <td><%= c.getDuration() %></td>
                                        <td><%= c.getFee() %></td>
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