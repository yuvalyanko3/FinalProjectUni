package project.naveyosefcc.service;

import project.naveyosefcc.entity.PreferableDays;
import project.naveyosefcc.entity.Pupil;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface PupilService {
    List<Pupil> getAllPupils();
    Map<String, Map<Date,String>> pupilGradesChart(String id);
    List<Object[]> amountOfLessonsPerPupil();
    boolean isPupilExists(String id);
    void addPupil(Pupil pupil);
    void deletePupilPrefDays(String id);
    void deleteSkillsForPupil(String id);
    Map<String, Object> getPupil(String id);
    Pupil findPupilById(String id);
    List<PreferableDays> findPupilPrefDays(String id);
    void addHours(String id, int hours);
    List<Object[]> getPupilSchedule(String id);
    void updatePupil(String id, String parentPhone, String pupilClass, String school, String schoolTeacher, String phoneTeacher);

   /*void addStudent(Pupil pupil);
    Map<String, Object> getStudent(String id); */
}

