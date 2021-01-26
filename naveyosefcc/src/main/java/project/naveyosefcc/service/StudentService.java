package project.naveyosefcc.service;

import project.naveyosefcc.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {
    List<Student> getAllStudents();
    void addStudent(Student student);
    Map<String, Object> getStudent(String id);
    void deleteSkillsForStudent(String id);
    void deletePrefDaysForStudent(String id);
    Student getStudentById(String id);
    void updateStudent(String id ,String institution, String degree, String program, String coordinator);
}
