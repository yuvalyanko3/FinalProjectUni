package project.naveyosefcc.dto;

import java.math.BigInteger;
import java.sql.Date;


public class TeacherWorkHoursDTO {

    private String teacherId;
    private Date startDate;
    private Date endDate;
    private Integer totalHours;

    public TeacherWorkHoursDTO(Date startDate, Date endDate, String teacherId, Object[] obj) {
        this.teacherId = teacherId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalHours = ((BigInteger) obj[0]).intValue();

    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(int totalHours) {
        this.totalHours = totalHours;
    }
}
