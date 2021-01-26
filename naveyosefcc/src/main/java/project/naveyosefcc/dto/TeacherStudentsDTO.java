package project.naveyosefcc.dto;

import project.naveyosefcc.entity.Pupil;
import project.naveyosefcc.entity.TeacherStudents;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class TeacherStudentsDTO {

    private String id;
    private String firstName;
    private String lastName;
    private String day;
    private Time startHour;

    public TeacherStudentsDTO(TeacherStudents teacherStudents) {
        this.id = teacherStudents.getPupil().getId();
        this.firstName = teacherStudents.getPupil().getFirstName();
        this.lastName = teacherStudents.getPupil().getLastName();
        this.day = teacherStudents.getDay();
        this.startHour = teacherStudents.getHour();
    }

    public TeacherStudentsDTO(Object[] obj) {
        int i = 0;
        this.id = (String) obj[i++];
        this.firstName = (String) obj[i++];
        this.lastName = (String) obj[i++];
        this.day = (String) obj[i++];
        this.startHour = (Time) obj[i++];
    }

    public static List<TeacherStudentsDTO> getDTOs(List<TeacherStudents> list) {
        List<TeacherStudentsDTO> toReturn = new ArrayList<>();
        list.forEach(i -> toReturn.add(new TeacherStudentsDTO(i)));
        return toReturn;
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
