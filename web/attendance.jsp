<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.Attendance, model.Student, model.Course, service.DataStore" %>
<%
    HttpSession sessionCheck = request.getSession(false);
    if (sessionCheck == null || sessionCheck.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<Attendance> attendanceRecords = DataStore.attendanceRecords;
    ArrayList<Student> students = DataStore.students;
    ArrayList<Course> courses = DataStore.courses;
    
    String filterStudent = request.getParameter("filterStudent");
    String filterCourse = request.getParameter("filterCourse");
    String filterDate = request.getParameter("filterDate");
    
    if (filterStudent != null && !filterStudent.isEmpty()) {
        attendanceRecords = DataStore.getAttendanceByStudent(filterStudent);
    } else if (filterCourse != null && !filterCourse.isEmpty()) {
        attendanceRecords = DataStore.getAttendanceByCourse(filterCourse);
    } else if (filterDate != null && !filterDate.isEmpty()) {
        attendanceRecords = DataStore.getAttendanceByDate(filterDate);
    }
    
    String successMsg = request.getParameter("success");
    String errorMsg = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management - SkillHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/theme.css">
</head>
<body>
    <!-- Navbar -->
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
            <i class="bi bi-calendar-check"></i> Attendance Management
        </h2>
        <hr>
        
        <!-- Success/Error Messages -->
        <% if (successMsg != null) { %>
            <div class="alert alert-success-custom alert-dismissible fade show">
                <i class="bi bi-check-circle"></i> <%= successMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        <% if (errorMsg != null) { %>
            <div class="alert alert-danger-custom alert-dismissible fade show">
                <i class="bi bi-exclamation-triangle"></i> <%= errorMsg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        <% } %>
        
        <!-- Statistics Cards -->
        <div class="row g-3 mb-4">
            <div class="col-md-3 col-6">
                <div class="stats-card bg-total">
                    <h6>Total Records</h6>
                    <div class="number"><%= DataStore.attendanceRecords.size() %></div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-card bg-present">
                    <h6>Present</h6>
                    <div class="number">
                        <% 
                            int present = 0;
                            for (Attendance a : DataStore.attendanceRecords) {
                                if ("Present".equals(a.getStatus())) present++;
                            }
                        %>
                        <%= present %>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-card bg-absent">
                    <h6>Absent</h6>
                    <div class="number">
                        <% 
                            int absent = 0;
                            for (Attendance a : DataStore.attendanceRecords) {
                                if ("Absent".equals(a.getStatus())) absent++;
                            }
                        %>
                        <%= absent %>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-card bg-late">
                    <h6>Late</h6>
                    <div class="number">
                        <% 
                            int late = 0;
                            for (Attendance a : DataStore.attendanceRecords) {
                                if ("Late".equals(a.getStatus())) late++;
                            }
                        %>
                        <%= late %>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Add Attendance Form -->
        <div class="card card-custom mb-4">
            <div class="card-header-custom">
                <i class="bi bi-plus-circle"></i> Add Attendance Record
            </div>
            <div class="card-body">
                <form action="AttendanceServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="row g-2">
                        <div class="col-md-2">
                            <input type="text" class="form-control form-control-custom" 
                                   name="id" placeholder="Attendance ID" required>
                        </div>
                        <div class="col-md-3">
                            <select class="form-select form-select-custom" name="studentId" required>
                                <option value="">Select Student</option>
                                <% for(Student s : students) { %>
                                    <option value="<%= s.getId() %>"><%= s.getId() %> - <%= s.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select class="form-select form-select-custom" name="courseId" required>
                                <option value="">Select Course</option>
                                <% for(Course c : courses) { %>
                                    <option value="<%= c.getId() %>"><%= c.getId() %> - <%= c.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="date" class="form-control form-control-custom" name="date" required>
                        </div>
                        <div class="col-md-2">
                            <select class="form-select form-select-custom" name="status" required>
                                <option value="Present">Present</option>
                                <option value="Absent">Absent</option>
                                <option value="Late">Late</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-custom" 
                                   name="remarks" placeholder="Remarks (optional)">
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary-custom w-100">
                                <i class="bi bi-save"></i> Add Attendance
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Filter Section -->
        <div class="card card-custom mb-4">
            <div class="card-header-custom" style="background: linear-gradient(135deg, #67533a, #8a704e);">
                <i class="bi bi-funnel"></i> Filter Attendance
            </div>
            <div class="card-body">
                <form method="get" action="attendance.jsp" class="row g-2">
                    <div class="col-md-3">
                        <select class="form-select form-select-custom" name="filterStudent">
                            <option value="">All Students</option>
                            <% for(Student s : students) { %>
                                <option value="<%= s.getId() %>" <%= (filterStudent != null && filterStudent.equals(s.getId())) ? "selected" : "" %>>
                                    <%= s.getId() %> - <%= s.getName() %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select form-select-custom" name="filterCourse">
                            <option value="">All Courses</option>
                            <% for(Course c : courses) { %>
                                <option value="<%= c.getId() %>" <%= (filterCourse != null && filterCourse.equals(c.getId())) ? "selected" : "" %>>
                                    <%= c.getId() %> - <%= c.getName() %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="date" class="form-control form-control-custom" 
                               name="filterDate" value="<%= filterDate != null ? filterDate : "" %>">
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-accent-custom w-100">
                            <i class="bi bi-search"></i> Apply Filter
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Attendance Records Table -->
        <div class="card card-custom">
            <div class="card-header-custom">
                <i class="bi bi-table"></i> Attendance Records
                <span class="badge bg-light float-end text-dark"><%= attendanceRecords.size() %> Records</span>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-custom">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Student</th>
                                <th>Course</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Remarks</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (attendanceRecords.isEmpty()) { %>
                                <tr>
                                    <td colspan="7" class="text-center text-muted">No attendance records found</td>
                                </tr>
                            <% } else { %>
                                <% for(Attendance a : attendanceRecords) { 
                                    String studentName = "";
                                    for(Student s : students) {
                                        if(s.getId().equals(a.getStudentId())) {
                                            studentName = s.getName();
                                            break;
                                        }
                                    }
                                    String courseName = "";
                                    for(Course c : courses) {
                                        if(c.getId().equals(a.getCourseId())) {
                                            courseName = c.getName();
                                            break;
                                        }
                                    }
                                    String statusClass = "";
                                    if("Present".equals(a.getStatus())) statusClass = "status-present";
                                    else if("Absent".equals(a.getStatus())) statusClass = "status-absent";
                                    else if("Late".equals(a.getStatus())) statusClass = "status-late";
                                %>
                                    <tr>
                                        <td><strong><%= a.getId() %></strong></td>
                                        <td><%= a.getStudentId() %> - <%= studentName %></td>
                                        <td><%= a.getCourseId() %> - <%= courseName %></td>
                                        <td><%= a.getDate() %></td>
                                        <td class="<%= statusClass %>"><%= a.getStatus() %></td>
                                        <td><%= a.getRemarks() != null ? a.getRemarks() : "" %></td>
                                        <td>
                                            <button class="btn btn-highlight-custom btn-sm" 
                                                    data-bs-toggle="modal" data-bs-target="#editModal" 
                                                    data-id="<%= a.getId() %>"
                                                    data-student="<%= a.getStudentId() %>"
                                                    data-course="<%= a.getCourseId() %>"
                                                    data-date="<%= a.getDate() %>"
                                                    data-status="<%= a.getStatus() %>"
                                                    data-remarks="<%= a.getRemarks() %>">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <a href="AttendanceServlet?action=delete&id=<%= a.getId() %>" 
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Are you sure you want to delete this attendance record?')">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
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
    
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header modal-header-custom">
                    <h5 class="modal-title"><i class="bi bi-pencil"></i> Edit Attendance Record</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="AttendanceServlet" method="post">
                    <input type="hidden" name="action" value="update">
                    <div class="modal-body">
                        <input type="hidden" id="editId" name="id">
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #1d4f2e;">Student</label>
                            <select class="form-select form-select-custom" id="editStudent" name="studentId" required>
                                <% for(Student s : students) { %>
                                    <option value="<%= s.getId() %>"><%= s.getId() %> - <%= s.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #1d4f2e;">Course</label>
                            <select class="form-select form-select-custom" id="editCourse" name="courseId" required>
                                <% for(Course c : courses) { %>
                                    <option value="<%= c.getId() %>"><%= c.getId() %> - <%= c.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #1d4f2e;">Date</label>
                            <input type="date" class="form-control form-control-custom" id="editDate" name="date" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #1d4f2e;">Status</label>
                            <select class="form-select form-select-custom" id="editStatus" name="status" required>
                                <option value="Present">Present</option>
                                <option value="Absent">Absent</option>
                                <option value="Late">Late</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #1d4f2e;">Remarks</label>
                            <input type="text" class="form-control form-control-custom" id="editRemarks" name="remarks">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary-custom" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary-custom">
                            <i class="bi bi-save"></i> Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer-custom mt-4">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 SkillHub Training Academy</p>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('[data-bs-target="#editModal"]').forEach(button => {
            button.addEventListener('click', function() {
                document.getElementById('editId').value = this.dataset.id;
                document.getElementById('editStudent').value = this.dataset.student;
                document.getElementById('editCourse').value = this.dataset.course;
                document.getElementById('editDate').value = this.dataset.date;
                document.getElementById('editStatus').value = this.dataset.status;
                document.getElementById('editRemarks').value = this.dataset.remarks || '';
            });
        });
    </script>
</body>
</html>