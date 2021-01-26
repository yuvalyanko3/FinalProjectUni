package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.DashboardDAO;

import java.util.List;

@Service
public class DashboardServiceImpl implements DashboardService {

    private DashboardDAO dashboardDAO;

    @Override
    public List<Object[]> getNumOfTeachersBySkill() {
        return dashboardDAO.getNumOfTeachersBySkill();
    }

    @Override
    public List<Object[]> getNumOfStudentsByProgram() {
        return dashboardDAO.getNumOfStudentsByProgram();
    }

    @Override
    public List<Object[]> getAVGradesByYearAndMonth() {
        return dashboardDAO.getAVGradesByYearAndMonth();
    }

    @Override
    public List<Object[]> getAVGradesByTeachers() {
        return dashboardDAO.getAVGradesByTeachers();
    }

    @Override
    public List<Object[]> getNumOfPupilsBySkills() {
        return dashboardDAO.getNumOfPupilsBySkills();
    }

    @Override
    public List<Object[]> getNumOfPupilsByAgeGroup() {
        return dashboardDAO.getNumOfPupilsByAgeGroup();
    }

    @Override
    public List<Object[]> getNumOfPupilsByAttendance() {
        return dashboardDAO.getNumOfPupilsByAttendance();
    }

    @Override
    public List<Object[]> getNumOfPupilsByNumOfClasses() {
        return dashboardDAO.getNumOfPupilsByNumOfClasses();
    }

    @Override
    public List<Object[]> getTOP3ofPupilsByAVG() {
        return dashboardDAO.getTOP3ofPupilsByAVG();
    }

    @Override
    public List<Object[]> getLAST3ofPupilsByAVG() {
        return dashboardDAO.getLAST3ofPupilsByAVG();
    }

    @Override
    public List<Object[]> getNumOfPupilsByGrades() {
        return dashboardDAO.getNumOfPupilsByGrades();
    }

    @Autowired
    public void setDashboardDAO(DashboardDAO dashboardDAO) {
        this.dashboardDAO = dashboardDAO;
    }
}
