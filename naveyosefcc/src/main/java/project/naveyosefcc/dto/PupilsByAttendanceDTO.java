package project.naveyosefcc.dto;

public class PupilsByAttendanceDTO {
    private String countPupils;
    private String attendance;

    public PupilsByAttendanceDTO(Object[] obj) {
        setAttendance((obj[0].toString()));
        this.countPupils = obj[1].toString();
    }

    public String getCountPupils() {
        return countPupils;
    }

    public String getAttendance() {
        return attendance;
    }

    public void setCountPupils(String countPupils) {
        this.countPupils = countPupils;
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
}
