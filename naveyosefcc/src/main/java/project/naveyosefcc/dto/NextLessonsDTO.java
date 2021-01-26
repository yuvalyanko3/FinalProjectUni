package project.naveyosefcc.dto;

import utils.E_Skills;

import java.sql.Time;

public class NextLessonsDTO {
    private String puFirstName;
    private String puLastName;
    private String day;
    private String startHour;
    private String skill;
    private int lastGrade;
    private String notes;

    public NextLessonsDTO(Object[] obj) {
        this.puFirstName = (String)obj[1];
        this.puLastName = (String)obj[2];
        this.day = (String)obj[3];
        this.startHour = (String)obj[4];
        setSkill((String)obj[5]);
        this.lastGrade = (int)obj[6];
        this.notes = (String)obj[7];
    }

    public String getPuFirstName() {
        return puFirstName;
    }

    public void setPuFirstName(String puFirstName) {
        this.puFirstName = puFirstName;
    }

    public String getPuLastName() {
        return puLastName;
    }

    public void setPuLastName(String puLastName) {
        this.puLastName = puLastName;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getStartHour() {
        return startHour;
    }

    public void setStartHour(String startHour) {
        this.startHour = startHour;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        if(skill.equals("ENGLISH"))
            this.skill = E_Skills.ENGLISH.getName();
        if(skill.equals("MATHEMATICS"))
            this.skill = E_Skills.MATHEMATICS.getName();

        if(skill.equals("HEBREW"))
            this.skill = E_Skills.HEBREW.getName();
    }

    public int getLastGrade() {
        return lastGrade;
    }

    public void setLastGrade(int lastGrade) {
        this.lastGrade = lastGrade;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
