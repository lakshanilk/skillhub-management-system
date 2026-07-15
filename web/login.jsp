<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - SkillHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/theme.css">
</head>
<body>
    <div class="container">
        <div class="login-container animate-fade-in">
            <div class="card">
                <div class="card-header">
                    <i class="bi bi-mortarboard"></i>
                    SkillHub Training Academy
                    <small class="d-block text-light" style="font-size: 0.8rem; opacity: 0.8;">Login to your account</small>
                </div>
                <div class="card-body">
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger">
                            <i class="bi bi-exclamation-triangle"></i> Invalid username or password!
                        </div>
                    <% } %>
                    
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label fw-bold">
                                <i class="bi bi-person"></i> Username
                            </label>
                            <div class="input-group">
                                <span class="input-group-text" style="background: var(--primary); color: white;">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" class="form-control" id="username" name="username" 
                                       placeholder="Enter username" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label fw-bold">
                                <i class="bi bi-lock"></i> Password
                            </label>
                            <div class="input-group">
                                <span class="input-group-text" style="background: var(--primary); color: white;">
                                    <i class="bi bi-key"></i>
                                </span>
                                <input type="password" class="form-control" id="password" name="password" 
                                       placeholder="Enter password" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </button>
                    </form>
                    
                    <div class="mt-3 text-center">
<!--                        <small class="text-muted">
                            <i class="bi bi-info-circle"></i> Default: admin / 1234
                        </small>-->
                    </div>
                </div>
                <div class="card-footer text-center text-muted">
                    <small>&copy; 2026 SkillHub Training Academy</small>
                </div>
            </div>
        </div>
    </div>
</body>
</html>