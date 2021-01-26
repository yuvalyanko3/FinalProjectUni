package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "studentactivities")
public class StudentActivities {

    @Id
    @Column(name = "act_date")
    private Date actDate;

//    @JoinColumn(name = "studentId")
////    private String studentId;

    @Column(name = "start_hour")
    private Time startHour;

    @Column(name = "finish_hour")
    private Time finishHour;

    @Column(name = "act_desc")
    private String actDesc;

    public StudentActivities() {}

    public StudentActivities(Date actDate, Time startHour,
                             Time finishHour, String actDesc) {
        this.actDate = actDate;
//        this.studentId = studentId;
        this.startHour = startHour;
        this.finishHour = finishHour;
        this.actDesc = actDesc;
    }

    public Date getActDate() {
        return actDate;
    }

    public void setActDate(Date actDate) {
        this.actDate = actDate;
    }

//    public String getStudentId() {
//        return studentId;
//    }
//
//    public void setStudentId(String studentId) {
//        this.studentId = studentId;
//    }

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

    public String getActDesc() {
        return actDesc;
    }

    public void setActDesc(String actDesc) {
        this.actDesc = actDesc;
    }
}
