
package model;

public class Enrollment {

    private String studentId;
    private String courseId;
    private String date;

    public Enrollment() {
    }

    public Enrollment(String studentId, String courseId, String date) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.date = date;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}