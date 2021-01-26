package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "lesson")
public class Lesson {

    @Id
    @Column(name = "lesson_id")
    private Integer id;

    @OneToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

    @OneToOne
    @JoinColumn(name = "pupil_id")
    private Pupil pupil;

    @Column(name = "lesson_date")
    private Date date;

//    @Column(name = "lesson_hour")
//    private Time lessonHour;

    @Column(name = "attendance")
    private int attendance;

    @Column(name = "lesson_description")
    private String lessonDesc;

    @Column(name = "lesson_grade")
    private int lessonGrade;

    @Column(name = "notes")
    private String notes;

    public Lesson() {
    }

    public Lesson(Integer id, Teacher teacher, Pupil pupil,
                  Date date, Time lessonHour, int attendance,
                  String lessonDesc, int lessonGrade, String notes) {
        this.id = id;
        this.teacher = teacher;
        this.pupil = pupil;
        this.date = date;
//        this.lessonHour = lessonHour;
        this.attendance = attendance;
        this.lessonDesc = lessonDesc;
        this.lessonGrade = lessonGrade;
        this.notes = notes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Pupil getPupil() {
        return pupil;
    }

    public void setPupil(Pupil pupil) {
        this.pupil = pupil;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

//    public Time getLessonHour() {
//        return lessonHour;
//    }
//
//    public void setLessonHour(Time lessonHour) {
//        this.lessonHour = lessonHour;
//    }

    public int getAttendance() {
        return attendance;
    }

    public void setAttendance(int attendance) {
        this.attendance = attendance;
    }

    public String getLessonDesc() {
        return lessonDesc;
    }

    public void setLessonDesc(String lessonDesc) {
        this.lessonDesc = lessonDesc;
    }

    public int getLessonGrade() {
        return lessonGrade;
    }

    public void setLessonGrade(int lessonGrade) {
        this.lessonGrade = lessonGrade;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}

