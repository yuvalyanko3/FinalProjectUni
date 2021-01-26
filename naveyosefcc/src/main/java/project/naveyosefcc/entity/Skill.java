package project.naveyosefcc.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "skills")
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "name")
public class Skill {

    @Id
    @Column(name = "skill_name")
    private String name;

    @OneToMany(mappedBy = "skill")
    Set<SkillsForPerson> people;

    @Transient
    private String hebrewName;

    public Skill() {}

    public Skill(String name) {
        this.name = name;
    }

    public Skill(String name, Set<SkillsForPerson> people) {
        this.name = name;
        this.people = people;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<SkillsForPerson> getPeople() {
        return people;
    }

    public void setPeople(Set<SkillsForPerson> people) {
        this.people = people;
    }

    public String getHebrewName() {
        return hebrewName;
    }

    public void setHebrewName(String hebrewName) {
        this.hebrewName = hebrewName;
    }
}
