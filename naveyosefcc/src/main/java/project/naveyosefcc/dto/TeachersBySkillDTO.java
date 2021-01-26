package project.naveyosefcc.dto;

import project.naveyosefcc.entity.Skill;
import utils.E_Skills;

public class TeachersBySkillDTO {
    private String skillName;
    private String countTeachers;

    public TeachersBySkillDTO(Object[] obj) {
        setSkillName((String)obj[0]);
        this.countTeachers = obj[1].toString();
    }

    public String getSkillName() {
        return skillName;
    }

    public String getCountTeachers() {
        return countTeachers;
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

    public void setCountTeachers(String countTeachers) {
        this.countTeachers = countTeachers;
    }
}
