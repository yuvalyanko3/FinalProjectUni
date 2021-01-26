package project.naveyosefcc.dto;

import java.math.BigInteger;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class StudentLessonsReportDTO {

    private String studentId;
    private Date startDate;
    private Date endDate;
    private Time startHour;
    private Time finishHour;
    private Time totalLessonTime;
    private String lessonDate;
    private String studentName;
    private String program;


    public StudentLessonsReportDTO(Date startDate, Date endDate,String studentId, Object[] obj) {
        this.studentId = studentId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.lessonDate = (String)obj[0];
        this.studentName = (String)obj[1];
        this.program = (String)obj[2];
        this.startHour = (Time)obj[3];
        this.finishHour = (Time)obj[4];
        this.totalLessonTime = (Time)obj[5];

    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Time getStartHour() {
        return startHour;
    }

    public void setStartHour(Time startHour) {
        this.startHour = startHour;
    }

    public Time getFinishHour() {
        return finishHour;
    }

    public void setFinishHour(Time finishHour) {
        this.finishHour = finishHour;
    }

    public Time getTotalLessonTime() {
        return totalLessonTime;
    }

    public void setTotalLessonTime(Time totalLessonTime) {
        this.totalLessonTime = totalLessonTime;
    }

    public String getLessonDate() {
        return lessonDate;
    }

    public void setLessonDate(String lessonDate) {
        this.lessonDate = lessonDate;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }


}
