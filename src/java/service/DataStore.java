package service;

import java.util.ArrayList;
import model.Attendance;
import model.Course;
import model.Enrollment;
import model.Student;
import model.Trainer;

public class DataStore {

    public static ArrayList<Student> students = new ArrayList<>();
    public static ArrayList<Course> courses = new ArrayList<>();
    public static ArrayList<Trainer> trainers = new ArrayList<>();
    public static ArrayList<Enrollment> enrollments = new ArrayList<>();
    public static ArrayList<Attendance> attendanceRecords = new ArrayList<>();  // ← NEW

    static {

        // Sample Students
        students.add(new Student("S001", "Kasun Perera", "kasun@gmail.com", "0770987866"));
        students.add(new Student("S002", "Nimal Karunarathna", "nimal@gmail.com", "0770091234"));
        students.add(new Student("S003", "Anjali Somadasa", "anjali@gmail.com", "0759876640"));
        students.add(new Student("S004", "Lakshani De Silva ", "lakshani@gmail.com", "0780909988"));
        students.add(new Student("S005", "Parami Pabodha ", "parami@gmail.com", "0740985644"));

        // Sample Courses
        courses.add(new Course("C001", "Java Programming", "6 Months", 50000));
        courses.add(new Course("C002", "Web Development", "4 Months", 30000));
        courses.add(new Course("C003", "Database Management", "4 Months", 30000));
        courses.add(new Course("C004", "Python Programming", "1 Year", 250000));
        courses.add(new Course("C005", "Node.js & MongoDB", "5 Year", 60000));

        // Sample Trainers
        trainers.add(new Trainer("T001", "Kamal Suriyabandara", "Expert in Java "));
        trainers.add(new Trainer("T002", "Amali Soisa", "Expert in Web Development"));
        trainers.add(new Trainer("T003", "Saman Kumara", "Expert in Database Management"));
        trainers.add(new Trainer("T004", "Lakmini Balasooriya", "Expert in Phython"));
        trainers.add(new Trainer("T005", "Tharaka Kumara", "Expert in Node.js & MongoDB"));

        // Sample Enrollments
        enrollments.add(new Enrollment("S001", "C001", "2026-01-15"));
        enrollments.add(new Enrollment("S001", "C002", "2026-01-16"));
        enrollments.add(new Enrollment("S002", "C001", "2026-01-17"));
        enrollments.add(new Enrollment("S003", "C002", "2026-01-18"));
        enrollments.add(new Enrollment("S004", "C003", "2026-01-19"));

        // Sample Attendance Records
        attendanceRecords.add(new Attendance("A001", "S001", "C001", "2026-01-20", "Present", "Good participation"));
        attendanceRecords.add(new Attendance("A002", "S001", "C002", "2026-01-21", "Present", "On time"));
        attendanceRecords.add(new Attendance("A003", "S002", "C001", "2026-01-20", "Absent", "Sick leave"));
        attendanceRecords.add(new Attendance("A004", "S003", "C002", "2026-01-21", "Late", "Traffic delay"));
        attendanceRecords.add(new Attendance("A005", "S004", "C003", "2026-01-22", "Present", "On time"));
    }

    // Helper method to get attendance count
    public static int getAttendanceCount() {
        return attendanceRecords.size();
    }

    // Helper method to get attendance by student
    public static ArrayList<Attendance> getAttendanceByStudent(String studentId) {
        ArrayList<Attendance> result = new ArrayList<>();
        for (Attendance a : attendanceRecords) {
            if (a.getStudentId().equals(studentId)) {
                result.add(a);
            }
        }
        return result;
    }

    // Helper method to get attendance by course
    public static ArrayList<Attendance> getAttendanceByCourse(String courseId) {
        ArrayList<Attendance> result = new ArrayList<>();
        for (Attendance a : attendanceRecords) {
            if (a.getCourseId().equals(courseId)) {
                result.add(a);
            }
        }
        return result;
    }

    // Helper method to get attendance by date
    public static ArrayList<Attendance> getAttendanceByDate(String date) {
        ArrayList<Attendance> result = new ArrayList<>();
        for (Attendance a : attendanceRecords) {
            if (a.getDate().equals(date)) {
                result.add(a);
            }
        }
        return result;
    }
}