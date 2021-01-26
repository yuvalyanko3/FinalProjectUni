package project.naveyosefcc.dto;

import utils.E_Skills;

import java.sql.Date;

public class LessonSheetDTO {
    private String teacherName;
    private String skillName;
    private String lessonDate;
    private String attendance;
    private String desc;
    private int grade;
    private String notes;
    private String justified;
    private String present;
    private String unjustified;
    private String all;

    public LessonSheetDTO(Object[] obj, Object[] obj2) {
        this.teacherName = (String)obj[2];
        setSkillName ((String)obj[3]);
        this.lessonDate = (String)obj[4];
        setAttendance((obj[5].toString()));
        this.desc = (String)obj[6];
        this.grade = (Integer) obj[7];
        this.notes = (String)obj[8];
        this.justified = obj2[1].toString();
        this.present = obj2[2].toString();
        this.unjustified = obj2[3].toString();
        this.all = obj2[4].toString();
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public void setSkillName(String skillName) {
        if(skillName.equals("ENGLISH")) {
            this.skillName = E_Skills.ENGLISH.getName();
        }
        if(skillName.equals("MATHEMATICS"))
            this.skillName = E_Skills.MATHEMATICS.getName();

        if(skillName.equals("HEBREW"))
            this.skillName = E_Skills.HEBREW.getName();
    }

    public void setLessonDate(String lessonDate) {
        this.lessonDate = lessonDate;
    }

    public void setAttendance(String attendance) {
        if(attendance.equals("1"))
            this.attendance = "נוכח";
        if(attendance.equals("2"))
            this.attendance = "היעדרות מוצדקת";
        if(attendance.equals("3"))
            this.attendance = "היעדרות לא מוצדקת";
        if(attendance.equals("4"))
            this.attendance = "היעדרות מורה";
        if(attendance.equals("5"))
            this.attendance = "חג";
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setJustified(String justified) {
        this.justified = justified;
    }

    public void setPresent(String present) {
        this.present = present;
    }

    public void setUnjustified(String unjustified) {
        this.unjustified = unjustified;
    }

    public void setAll(String all) {
        this.all = all;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public String getSkillName() {
        return skillName;
    }

    public String getLessonDate() {
        return lessonDate;
    }

    public String getAttendance() {
        return attendance;
    }

    public String getDesc() {
        return desc;
    }

    public int getGrade() {
        return grade;
    }

    public String getNotes() {
        return notes;
    }

    public String getJustified() {
        return justified;
    }

    public String getPresent() {
        return present;
    }

    public String getUnjustified() {
        return unjustified;
    }

    public String getAll() {
        return all;
    }
}
