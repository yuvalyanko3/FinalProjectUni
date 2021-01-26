package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.TeacherStudentsDAO;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.TeacherStudents;

import java.sql.Time;
import java.util.List;

@Service
public class TeacherStudentsServiceImpl implements TeacherStudentsService{

    private TeacherStudentsDAO teacherStudentsDAO;

    @Override
    public List<TeacherStudents> getAll() {
        return teacherStudentsDAO.findAll();
    }

    @Override
    public void addTeacherStudentRelation(String tId, String pId, String day, Time hour, String skill) {
        teacherStudentsDAO.addTeacherStudentRelation(tId, pId, day, hour, skill);
    }

    @Override
    public List<Object[]> getTeacherStudentDTO(String teacherId) {
        return teacherStudentsDAO.getTeacherStudentDTO(teacherId);
    }

    @Autowired
    public void setTeacherStudentDAO(TeacherStudentsDAO teacherStudentsDAO) {
        this.teacherStudentsDAO = teacherStudentsDAO;
    }
}
