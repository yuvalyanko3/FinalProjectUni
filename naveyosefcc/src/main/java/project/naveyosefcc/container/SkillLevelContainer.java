package project.naveyosefcc.container;

import project.naveyosefcc.entity.SkillsForPerson;

public class SkillLevelContainer {

    SkillsForPerson hebLevel;
    SkillsForPerson mathLevel;
    SkillsForPerson engLevel;

    public SkillLevelContainer() {
        this.hebLevel = new SkillsForPerson();
        this.hebLevel.setLevel(-1);
        this.mathLevel = new SkillsForPerson();
        this.mathLevel.setLevel(-1);
        this.engLevel = new SkillsForPerson();
        this.engLevel.setLevel(-1);
    }

    public int getHebLevel() {
        return hebLevel.getLevel();
    }

    public void setHebLevel(int level) {
        this.hebLevel.setLevel(level);
    }

    public int getMathLevel() {
        return mathLevel.getLevel();
    }

    public void setMathLevel(int level) {
        this.mathLevel.setLevel(level);
    }

    public int getEngLevel() {
        return engLevel.getLevel();
    }

    public void setEngLevel(int level) {
        this.engLevel.setLevel(level);
    }
}
