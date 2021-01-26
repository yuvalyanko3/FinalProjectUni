package project.naveyosefcc.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "skillsforperson")
public class SkillsForPerson {

    @EmbeddedId
    @JsonBackReference
    private SkillsForPersonKey id;

    @ManyToOne
    @MapsId("person")
    @JoinColumn(name = "person_id", referencedColumnName = "id")
    private Person person;

    @ManyToOne
    @MapsId("skill")
    @JoinColumn(name = "skill_name", referencedColumnName = "skill_name")
    private Skill skill;

    @Column(name = "level")
    private int level;

    public SkillsForPerson() {
    }

    public SkillsForPerson(SkillsForPersonKey id, Person person, Skill skill, int level) {
        this.id = id;
        this.person = person;
        this.skill = skill;
        this.level = level;
    }

    public SkillsForPersonKey getId() {
        return id;
    }

    public void setId(SkillsForPersonKey id) {
        this.id = id;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

}
