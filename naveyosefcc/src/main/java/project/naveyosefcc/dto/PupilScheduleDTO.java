package project.naveyosefcc.dto;

import java.sql.Time;

public class PupilScheduleDTO {
    private String firstName;
    private String lastName;
    private String day;
    private Time startHour;

    public PupilScheduleDTO(Object[] obj) {
        this.firstName = (String)obj[0];
        this.lastName = (String)obj[1];
        this.day = (String)obj[2];
        this.startHour = (Time)obj[3];
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
}
