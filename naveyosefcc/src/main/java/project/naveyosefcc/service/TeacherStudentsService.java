package project.naveyosefcc.service;

import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.TeacherStudents;

import java.sql.Time;
import java.util.List;

public interface TeacherStudentsService {

    List<TeacherStudents> getAll();
    void addTeacherStudentRelation(String tId, String pId, String day, Time hour, String skill);
    List<Object[]> getTeacherStudentDTO(String teacherId);
}
