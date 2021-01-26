package project.naveyosefcc.service;

import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.Lesson;

import java.sql.Date;
import java.util.List;

public interface LessonService {

    List<Object[]> getPupilLessons(String id);
    List<Object[]> getAttendanceSum(String id);
    List<Object[]> getTeacherPupilLessons(String teacherId, String pupilId);
    void addLesson(Integer lessonId, String teacherId, String pupilId, String subject, Date date,
                   Integer attendance, String description, Integer grade, String notes);
    Integer getLastLessonId(String teacherId, String pupilId);

    List<Object[]> getNextLessons(String id);

}
