package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.naveyosefcc.entity.Student;

import java.util.List;

@Repository
public abstract class StudentDAOImpl implements StudentDAO {

    private StudentDAO studentDAO;

    public List<Student> getAllStudents(){return studentDAO.findAll();}

    @Autowired
    public void setStudentDAO(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }
}
