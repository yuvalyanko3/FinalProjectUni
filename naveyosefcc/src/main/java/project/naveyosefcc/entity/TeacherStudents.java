package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name = "teacherstudents")
public class TeacherStudents {

    @EmbeddedId
    private TeacherStudentKey key;

    @ManyToOne
    @MapsId("teacher")
    @JoinColumn(name = "teacher_id", referencedColumnName = "id")
    private Person teacher;

    @ManyToOne
    @MapsId("pupil")
    @JoinColumn(name = "pupil_id", referencedColumnName = "pupil_id")
    private Pupil pupil;

    @Column(name = "day")
    private String day;

    @Column(name = "hour")
    private Time hour;

    public TeacherStudents() {
    }

    public TeacherStudents(TeacherStudentKey key, Person teacher, Pupil pupil, String day, Time hour) {
        this.key = key;
        this.teacher = teacher;
        this.pupil = pupil;
        this.day = day;
        this.hour = hour;
    }

    public TeacherStudentKey getKey() {
        return key;
    }

    public void setKey(TeacherStudentKey key) {
        this.key = key;
    }

    public Person getTeacher() {
        return teacher;
    }

    public void setTeacher(Person teacher) {
        this.teacher = teacher;
    }

    public Pupil getPupil() {
        return pupil;
    }

    public void setPupil(Pupil pupil) {
        this.pupil = pupil;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public Time getHour() {
        return hour;
    }

    public void setHour(Time hour) {
        this.hour = hour;
    }
}
