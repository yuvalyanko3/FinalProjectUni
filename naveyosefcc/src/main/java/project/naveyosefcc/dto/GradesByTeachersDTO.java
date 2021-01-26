package project.naveyosefcc.dto;

public class GradesByTeachersDTO {
    private String teacherName;
    private String avg;

    public GradesByTeachersDTO(Object[] obj) {
        this.teacherName = (String)obj[0];
        this.avg = obj[1].toString();
    }

    public String getTeacherName() {
        return teacherName;
    }

    public String getAvg() {
        return avg;
    }
}
