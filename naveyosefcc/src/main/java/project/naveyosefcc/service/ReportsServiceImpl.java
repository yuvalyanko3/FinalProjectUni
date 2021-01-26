package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.StudentDAO;
import project.naveyosefcc.dao.TeacherDAO;

import java.util.Date;
import java.util.List;

@Service
public class ReportsServiceImpl implements ReportsService{

    private TeacherDAO teacherDAO;
    private StudentDAO studentDAO;


    @Override
    public List<Object[]> teacherLessonsReport(Date startDate, Date endDate, String id) {
        return teacherDAO.teacherLessonsReport(startDate,endDate,id);
    }

    @Override
    public List<Object[]> teacherWorkHours(Date startDate, Date endDate, String id){
        return teacherDAO.totalWorkHours(startDate, endDate, id);
    }

    @Override
    public List<Object[]> StudentLessonsReport(Date startDate, Date endDate, String id) {
        return studentDAO.StudentLessonsReport(startDate,endDate,id);
    }

    @Autowired
    public void setTeacherDAO(project.naveyosefcc.dao.TeacherDAO teacherDAO) {
        this.teacherDAO = teacherDAO;
    }

    @Autowired
    public void setStudentDAO(project.naveyosefcc.dao.StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }
}
