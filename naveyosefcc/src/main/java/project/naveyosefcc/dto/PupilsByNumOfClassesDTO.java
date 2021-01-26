package project.naveyosefcc.dto;

public class PupilsByNumOfClassesDTO {
    private String numOfClasses;
    private String numOfPupils;

    public PupilsByNumOfClassesDTO(Object[] obj) {
        this.numOfClasses = obj[0].toString();
        this.numOfPupils =obj[1].toString();
    }

    public String getNumOfClasses() {
        return numOfClasses;
    }

    public String getNumOfPupils() {
        return numOfPupils;
    }
}
