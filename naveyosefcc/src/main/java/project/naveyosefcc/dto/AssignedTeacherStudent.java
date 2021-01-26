package project.naveyosefcc.dto;

import java.sql.Time;

public class AssignedTeacherStudent {

    private String teacherId;
    private String pupilId;
    private String pupilFirstName;
    private String pupilLastName;
    private String day;
    private Time hour;

    public AssignedTeacherStudent(Object[] obj) {
        int i = 0;
        this.teacherId = (String) obj[i++];
        this.pupilId = (String) obj[i++];
        this.pupilFirstName = (String) obj[i++];
        this.pupilLastName= (String) obj[i++];
        this.day = (String) obj[i++];
        this.hour = (Time) obj[i++];
    }

    public String getPupilId() {
        return pupilId;
    }

    public void setPupilId(String pupilId) {
        this.pupilId = pupilId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getPupilFirstName() {
        return pupilFirstName;
    }

    public void setPupilFirstName(String pupilFirstName) {
        this.pupilFirstName = pupilFirstName;
    }

    public String getPupilLastName() {
        return pupilLastName;
    }

    public void setPupilLastName(String pupilLastName) {
        this.pupilLastName = pupilLastName;
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
