package project.naveyosefcc.dto;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class TeacherLessonsReportDTO {

    private String teacherId;
    private String pupilId;
    private Date startDate;
    private Date endDate;
    private String lessonDate;
    private String pupilName;
    private Time lessonHour;


    public TeacherLessonsReportDTO(Date startDate, Date endDate,String teacherId, Object[] obj) {
        this.teacherId = teacherId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.lessonDate = (String) obj[0];
        this.pupilId = (String)obj[1];
        this.pupilName = (String)obj[2];
        this.lessonHour = (Time)obj[3];
    }

    public TeacherLessonsReportDTO(String teacherId, Object[] obj) {
        this.teacherId = teacherId;
        this.lessonDate = (String) obj[0];
        this.pupilId = (String)obj[1];
        this.pupilName = (String)obj[2];
        this.lessonHour =(Time)obj[3];
    }


    public String getTeacherId() {
        return teacherId;
    }

    public String getPupilId() {
        return pupilId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public String getLessonDate() {
        return lessonDate;
    }

    public String getPupilName() {
        return pupilName;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public void setPupilId(String pupilId) {
        this.pupilId = pupilId;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setLessonDate(String lessonDate) {
        this.lessonDate = lessonDate;
    }

    public void setPupilName(String pupilName) {
        this.pupilName = pupilName;
    }

    public Time getLessonHour() { return lessonHour; }

    public void setLessonHour(Time lessonHour) { this.lessonHour = lessonHour; }

}
