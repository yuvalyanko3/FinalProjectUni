package project.naveyosefcc.dto;

import utils.E_Programs;

public class StudentsByProgramDTO {
    private String volunteerProgram;
    private String countStudents;

    public StudentsByProgramDTO(Object[] obj) {
        setVolunteerProgram((String)obj[0]);
        this.countStudents = obj[1].toString();
    }

    public String getVolunteer_program() {
        return volunteerProgram;
    }

    public String getCountStudents() {
        return countStudents;
    }

    public void setVolunteerProgram(String volunteerProgram) {
        if(volunteerProgram.equals("FLOWER")) {
            this.volunteerProgram = E_Programs.FLOWER.getName();
        }
        if(volunteerProgram.equals("SAHAK"))
            this.volunteerProgram = E_Programs.SAHAK.getName();
    }

    public void setCountStudents(String countStudents) {
        this.countStudents = countStudents;
    }

    @Override
    public String toString() {
        return "Dashboard2DTO{" +
                "volunteerProgram='" + volunteerProgram + '\'' +
                ", countStudents='" + countStudents + '\'' +
                '}';
    }
}
