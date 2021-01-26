package project.naveyosefcc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.naveyosefcc.dao.LessonDAO;
import project.naveyosefcc.entity.Lesson;

import java.sql.Date;
import java.util.List;

@Service
public class LessonServiceImpl implements LessonService {

    private LessonDAO lessonDAO;

    @Override
    public List<Object[]> getPupilLessons(String id) {
        return lessonDAO.getPupilLessons(id);
    }

    @Override
    public List<Object[]> getAttendanceSum(String id) {
        return lessonDAO.getAttendanceSum(id);
    }

    @Override
    public List<Object[]> getTeacherPupilLessons(String teacherId, String pupilId) {
        return lessonDAO.getTeacherPupilLessons(teacherId, pupilId);
    }

    @Override
    public List<Object[]> getNextLessons(String id) {
        return lessonDAO.getNextLessons(id);
    }



    @Override
    public void addLesson(Integer lessonId, String teacherId, String pupilId, String subject, Date date, Integer attendance, String description, Integer grade, String notes) {
        lessonDAO.addLesson(lessonId, teacherId, pupilId, subject, date, attendance, description, grade, notes);
    }

    @Override
    public Integer getLastLessonId(String teacherId, String pupilId) {
        Integer toReturn = lessonDAO.getLastLessonId(teacherId, pupilId);
        return (toReturn == null) ? 0 : toReturn;
    }

    @Autowired
    public void setLessonDAO(LessonDAO lessonDAO) {
        this.lessonDAO = lessonDAO;
    }
}
