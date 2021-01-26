package project.naveyosefcc.dto;

import utils.E_Skills;

public class PupilsBySkillsDTO {
    private String skillName;
    private String countPupils;

    public PupilsBySkillsDTO(Object[] obj) {
        setSkillName((String)obj[0]);
        this.countPupils = obj[1].toString();
    }

    public String getSkillName() {
        return skillName;
    }

    public String getCountPupils() {
        return countPupils;
    }

    public void setSkillName(String skillName) {
        if(skillName.equals("ENGLISH")) {
            this.skillName = E_Skills.ENGLISH.getName();
        }
        if(skillName.equals("MATHEMATICS"))
            this.skillName = E_Skills.MATHEMATICS.getName();

        if(skillName.equals("HEBREW"))
            this.skillName = E_Skills.HEBREW.getName();
    }

}
