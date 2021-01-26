package project.naveyosefcc.dto;

import java.sql.Date;

public class ExampleDTO {

    private String teacherId;
    private String pupilId;
    private Date lessonDate;
    private String lessonType;
    private int score;

    public ExampleDTO(String teacherId, Object[] obj) {
        this.teacherId = teacherId;
        this.pupilId = (String)obj[0];
        this.lessonDate = (Date)obj[1];
        this.lessonType = (String)obj[2];
        this.score = (Integer)obj[3];
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getPupilId() {
        return pupilId;
    }

    public void setPupilId(String pupilId) {
        this.pupilId = pupilId;
    }

    public Date getLessonDate() {
        return lessonDate;
    }

    public void setLessonDate(Date lessonDate) {
        this.lessonDate = lessonDate;
    }

    public String getLessonType() {
        return lessonType;
    }

    public void setLessonType(String lessonType) {
        this.lessonType = lessonType;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
