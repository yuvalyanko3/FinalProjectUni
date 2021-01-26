package project.naveyosefcc.service;

import java.util.List;

public interface DashboardService {
    List<Object[]> getNumOfTeachersBySkill();
    List<Object[]> getNumOfStudentsByProgram();
    List<Object[]> getAVGradesByYearAndMonth();
    List<Object[]> getAVGradesByTeachers();
    List<Object[]> getNumOfPupilsBySkills();
    List<Object[]> getNumOfPupilsByAgeGroup();
    List<Object[]> getNumOfPupilsByAttendance();
    List<Object[]> getNumOfPupilsByNumOfClasses();
    List<Object[]> getTOP3ofPupilsByAVG();
    List<Object[]> getLAST3ofPupilsByAVG();
    List<Object[]> getNumOfPupilsByGrades();
}
