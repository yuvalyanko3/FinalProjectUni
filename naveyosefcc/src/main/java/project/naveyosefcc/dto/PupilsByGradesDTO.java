package project.naveyosefcc.dto;

public class PupilsByGradesDTO {
    private String numOfPupils;
    private String grades;

    public PupilsByGradesDTO(Object[] obj) {
        this.grades = obj[0].toString();
        this.numOfPupils =obj[1].toString();
    }

    public String getNumOfPupils() {
        return numOfPupils;
    }

    public void setNumOfPupils(String numOfPupils) {
        this.numOfPupils = numOfPupils;
    }

    public String getGrades() {
        return grades;
    }

    public void setGrades(String grades) {
        this.grades = grades;
    }
}
