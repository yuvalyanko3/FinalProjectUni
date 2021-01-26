package project.naveyosefcc.dto;

import java.sql.Date;

public class TeacherPupilSheetDTO {

    private Integer lessonId;
    private String subject;
    private String date;
    private Integer attendance;
    private String desc;
    private Integer grade;
    private String notes;

    public TeacherPupilSheetDTO(Object[] objects) {
        int i = 0;
        lessonId = (Integer) objects[i++];
        subject = (String) objects[i++];
        date = (String) objects[i++];
        attendance = (Integer) objects[i++];
        desc = (String) objects[i++];
        grade = (Integer) objects[i++];
        notes = (String) objects[i++];
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getAttendance() {
        return attendance;
    }

    public void setAttendance(Integer attendance) {
        this.attendance = attendance;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
