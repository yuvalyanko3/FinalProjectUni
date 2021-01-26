package project.naveyosefcc.dto;

public class AttendanceSumDTO {
    private String pupilId;
    private String justified;
    private String present;
    private String unjustified;
    private String all;

    public AttendanceSumDTO(Object[] obj) {
        this.pupilId = (String)obj[0];
        this.justified = obj[1].toString();
        this.present = obj[2].toString();
        this.unjustified = obj[3].toString();
        this.all = obj[4].toString();
    }

    public String getPupilId() {
        return pupilId;
    }

    public void setPupilId(String pupilId) {
        this.pupilId = pupilId;
    }

    public String getJustified() {
        return justified;
    }

    public void setJustified(String justified) {
        this.justified = justified;
    }

    public String getPresent() {
        return present;
    }

    public void setPresent(String present) {
        this.present = present;
    }

    public String getUnjustified() {
        return unjustified;
    }

    public void setUnjustified(String unjustified) {
        this.unjustified = unjustified;
    }

    public String getAll() {
        return all;
    }

    public void setAll(String all) {
        this.all = all;
    }
}
