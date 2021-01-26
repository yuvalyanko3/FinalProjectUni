package project.naveyosefcc.service;

import java.util.Date;
import java.util.List;

public interface ReportsService {

    List<Object[]> teacherLessonsReport(Date startDate, Date endDate, String id);

    List<Object[]> teacherWorkHours(Date startDate, Date endDate, String id);

    List<Object[]> StudentLessonsReport(Date startDate, Date endDate, String id);

}
