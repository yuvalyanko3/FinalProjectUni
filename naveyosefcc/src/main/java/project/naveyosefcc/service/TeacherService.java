package project.naveyosefcc.service;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.PreferableDays;
import project.naveyosefcc.entity.SkillsForPerson;
import project.naveyosefcc.entity.Teacher;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface TeacherService {
//    List<Teacher> getTeachers();
    List<Object[]> getTeachers();
    Teacher findTeacherById(String id);
    void addTeacher(Teacher teacher);
    void addSkillForTeacher(String id, String name, int lvl);
    boolean isTeacherExists(String id);
    void deleteTeacher(String id);
    List<PreferableDays> findTeacherPrefDays(String id);
    void deleteTeacherPrefDays(String id);
    void deleteSkillsForTeacher(String id);
    Map<String, Object> getTeacher(String id);
    List<Object[]> teacherWeeklySchedule(String id);
/*    List<Object[]> getObjects(String id); */
    List<Object[]> getChartData(String teacherId, String pupilId);
}
