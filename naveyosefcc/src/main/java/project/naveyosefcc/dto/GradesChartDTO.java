package project.naveyosefcc.dto;

import utils.E_Skills;

import java.sql.Date;

public class GradesChartDTO {

    private String teacherId;
    private String pupilId;
    private String lessonDate;
    private String lessonType;
    private int score;

    public GradesChartDTO(String teacherId, Object[] obj) {
        this.teacherId = teacherId;
        this.pupilId = (String)obj[0];
        this.lessonDate = (String)obj[1];
        setLessonType((String)obj[2]);
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

    public String getLessonDate() {
        return lessonDate;
    }

    public void setLessonDate(String lessonDate) {
        this.lessonDate = lessonDate;
    }

    public String getLessonType() {
        return lessonType;
    }

    public void setLessonType(String lessonType) {
        if(lessonType.equals("ENGLISH")) {
            this.lessonType = E_Skills.ENGLISH.getName();
        }
        if(lessonType.equals("MATHEMATICS"))
            this.lessonType = E_Skills.MATHEMATICS.getName();

        if(lessonType.equals("HEBREW"))
            this.lessonType = E_Skills.HEBREW.getName();
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
