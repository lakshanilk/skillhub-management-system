<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession, service.DataStore" %>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String user = (String) sessionCheck.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - SkillHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/theme.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="bi bi-mortarboard"></i> SkillHub Training
            </a>
            <div class="d-flex align-items-center">
                <span class="text-light me-3">
                    <i class="bi bi-person-circle"></i> Welcome, <strong><%= user %></strong>
                </span>
                <a href="LogoutServlet" class="btn btn-outline-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-4">
        <h2 class="page-title">
            <i class="bi bi-grid"></i> Dashboard
        </h2>
        <p class="text-muted">Welcome back, <%= user %>! Manage your training academy from here.</p>
        <hr>
        
        <div class="row g-4">
            <!-- Students -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card">
                    <span class="icon icon-green">
                        <i class="bi bi-people"></i>
                    </span>
                    <h5 class="card-title">Students</h5>
                    <p class="text-muted small">Manage student records</p>
                    <span class="badge" style="background: #286a40; color: #fff;">
                        <%= DataStore.students.size() %> Records
                    </span>
                    <a href="students.jsp" class="btn btn-primary-custom btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                </div>
            </div>
            
            <!-- Courses -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card">
                    <span class="icon icon-light-green">
                        <i class="bi bi-book"></i>
                    </span>
                    <h5 class="card-title">Courses</h5>
                    <p class="text-muted small">Manage course catalog</p>
                    <span class="badge" style="background: #7eb671; color: #fff;">
                        <%= DataStore.courses.size() %> Records
                    </span>
                    <a href="courses.jsp" class="btn btn-secondary-custom btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                </div>
            </div>
            
            <!-- Trainers -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card">
                    <span class="icon icon-brown">
                        <i class="bi bi-person-badge"></i>
                    </span>
                    <h5 class="card-title">Trainers</h5>
                    <p class="text-muted small">Manage trainer profiles</p>
                    <span class="badge" style="background: #67533a; color: #fff;">
                        <%= DataStore.trainers.size() %> Records
                    </span>
                    <a href="trainers.jsp" class="btn btn-accent-custom btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                </div>
            </div>
            
            <!-- Enrollments -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card">
                    <span class="icon icon-gold">
                        <i class="bi bi-journal"></i>
                    </span>
                    <h5 class="card-title">Enrollments</h5>
                    <p class="text-muted small">Manage enrollments</p>
                    <span class="badge" style="background: #b69458; color: #fff;">
                        <%= DataStore.enrollments.size() %> Records
                    </span>
                    <a href="enrollment.jsp" class="btn btn-highlight-custom btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                </div>
            </div>
            
            <!-- Attendance -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card" style="border-bottom-color: #b69458;">
                    <span class="icon icon-gold">
                        <i class="bi bi-calendar-check"></i>
                    </span>
                    <h5 class="card-title">Attendance</h5>
                    <p class="text-muted small">Manage attendance</p>
                    <span class="badge" style="background: #b69458; color: #fff;">
                        <%= DataStore.attendanceRecords.size() %> Records
                    </span>
                    <a href="attendance.jsp" class="btn btn-highlight-custom btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                </div>
            </div>
            
            <!-- RequestDispatcher Demo -->
            <div class="col-md-4 col-lg-3">
                <div class="dashboard-card" style="border-bottom-color: #67533a;">
                    <span class="icon icon-brown">
                        <i class="bi bi-arrow-right-circle"></i>
                    </span>
                    <h5 class="card-title">Forward Demo</h5>
                    <p class="text-muted small">RequestDispatcher test</p>
                    <a href="ForwardDemoServlet" class="btn btn-accent-custom btn-sm">
                        <i class="bi bi-arrow-right"></i> Test
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer-custom mt-5">
        <div class="container text-center">
            <p class="mb-0">
                &copy; 2026 <strong>SkillHub Training Academy</strong> | 
                <i class="bi bi-mortarboard"></i> Professional Training Management
            </p>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>