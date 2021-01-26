package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.config.SecurityConfig;
import project.naveyosefcc.dao.StudentActivitiesDAO;
import project.naveyosefcc.entity.StudentActivities;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Service
public class StudentActivitiesServiceImpl implements StudentActivitiesService {

    private StudentActivitiesDAO studentActivitiesDAO;

    @Override
    public List<StudentActivities> getMonthlyActivities(String studentId) {
        List<StudentActivities> s = studentActivitiesDAO.getMonthlyActivities(studentId);
        return studentActivitiesDAO.getMonthlyActivities(studentId);
    }

    @Override
    public void addActivity(Date date, String studentId, Time start, Time end, String desc) {
        studentActivitiesDAO.addActivity(date, studentId, start, end, desc);
    }

    @Override
    public void removeActivity(Date date, String studentId) {
        studentActivitiesDAO.deleteHourReport(date, studentId);
    }

    @Autowired
    public void setStudentActivitiesDAO(StudentActivitiesDAO studentActivitiesDAO) {
        this.studentActivitiesDAO = studentActivitiesDAO;
    }
}
