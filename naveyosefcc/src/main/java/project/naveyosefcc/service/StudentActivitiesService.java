package project.naveyosefcc.service;

import project.naveyosefcc.entity.StudentActivities;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface StudentActivitiesService {

    List<StudentActivities> getMonthlyActivities(String studentId);
    void addActivity(Date date, String studentId, Time start, Time end, String desc);
    void removeActivity(Date date, String studentId);
}
