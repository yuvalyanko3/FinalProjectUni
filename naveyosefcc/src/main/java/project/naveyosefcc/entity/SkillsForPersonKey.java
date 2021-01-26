package project.naveyosefcc.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class SkillsForPersonKey implements Serializable {

    private String person;

    private String skill;

    public SkillsForPersonKey() {}

    public SkillsForPersonKey(String personId, String personSkill) {
        this.person = personId;
        this.skill = personSkill;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String personId) {
        this.person = personId;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String personSkill) {
        this.skill = personSkill;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SkillsForPersonKey that = (SkillsForPersonKey) o;
        return person.equals(that.person) &&
                skill.equals(that.skill);
    }

    @Override
    public int hashCode() {
        return Objects.hash(person, skill);
    }
}
