<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>RequestDispatcher Demo - SkillHub</title>
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
            <i class="bi bi-arrow-right-circle"></i> RequestDispatcher Demo
        </h2>
        <hr>
        
        <div class="card card-custom">
            <div class="card-header-custom">
                <i class="bi bi-info-circle"></i> Forward Example
            </div>
            <div class="card-body">
                <div class="alert alert-success-custom">
                    <h5><i class="bi bi-check-circle"></i> <%= request.getAttribute("message") %></h5>
                    <p><i class="bi bi-clock"></i> Timestamp: <%= request.getAttribute("timestamp") %></p>
                </div>
                <p>This page was reached via <strong>RequestDispatcher.forward()</strong> method.</p>
                <hr>
                <div class="text-muted">
                    <small><i class="bi bi-info-circle"></i> This demonstrates the forward mechanism in Java EE.</small>
                </div>
                <a href="dashboard.jsp" class="btn btn-secondary-custom mt-3">
                    <i class="bi bi-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </div>
    </div>
    
    <div class="footer-custom mt-4">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 SkillHub Training Academy</p>
        </div>
    </div>
</body>
</html>