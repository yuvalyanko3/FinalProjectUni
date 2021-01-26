package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.naveyosefcc.entity.Teacher;

import java.util.List;
import java.util.Optional;

@Repository
public abstract class TeacherDAOImpl implements TeacherDAO {

    private TeacherDAO teacherDAO;

    public List<Object[]> getTeachers() {
        return teacherDAO.getTeachers();
    }

//    public List<Teacher> getTeachers() {
//        return teacherDAO.findAll();
//    }

    public void addTeacher(Teacher teacher) {
        teacherDAO.save(teacher);
    }

    public Teacher findTeacherById(String id){
        return teacherDAO.findTeacherById(id);
    }

    @Autowired
    public void setTeacherDAO(TeacherDAO teacherDAO) {
        this.teacherDAO = teacherDAO;
    }
}
