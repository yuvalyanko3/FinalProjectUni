package project.naveyosefcc.dto;

public class PupilsByAgeGroupDTO {
    private String countPupils;
    private String ageGroups;

    public PupilsByAgeGroupDTO(Object[] obj) {
        this.countPupils = obj[0].toString();
        this.ageGroups = (String)obj[1];
    }

    public String getCountPupils() {
        return countPupils;
    }

    public String getAgeGroups() {
        return ageGroups;
    }
}
