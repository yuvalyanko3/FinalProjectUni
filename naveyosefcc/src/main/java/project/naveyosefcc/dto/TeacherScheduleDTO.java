package project.naveyosefcc.dto;

import java.sql.Time;

public class TeacherScheduleDTO {

    private String id;
    private String firstName;
    private String lastName;
    private byte level;
    private String day;
    private Time startHour;
    private Time finishHour;
    private String type;

    public TeacherScheduleDTO(Object[] obj) {
        int i = 0;
        this.id = (String) obj[i++];
        this.firstName = (String) obj[i++];
        this.lastName = (String) obj[i++];
        this.level = (byte) obj[i++];
        this.day = (String) obj[i++];
        this.startHour = (Time) obj[i++];
        this.finishHour = (Time) obj[i++];
        this.type = (String) obj[i++];
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public byte getLevel() {
        return level;
    }

    public void setLevel(byte level) {
        this.level = level;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
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

    public void setType(String type) { this.type = type; }

    public String getType() { return type; }
}
