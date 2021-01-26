package project.naveyosefcc.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.*;

@Entity
@Table(name = "person")
@Inheritance(strategy = InheritanceType.JOINED)
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "id")
public class Person {

    @Id
    @Size(min = 1)
    private String id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "birth_date")
    private Date birthDate;

    @Column(name = "gender")
    private String gender;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @OneToMany(mappedBy = "person")
    Set<SkillsForPerson> skills;

    @OneToMany(mappedBy = "teacher")
    List<TeacherStudents> pupil;

    public Person() {}

    public Person(String id) {
        this.id = id;
    }

    public Person(String id, String firstName, String lastName,
                  Date birthDate, String gender, String phone,
                  String email, Set<SkillsForPerson> skills) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.skills = skills;
    }

    public Person(String id, String firstName, String lastName,
                  Date birthDate, String gender, String phone,
                  String email, String skill, String level) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        Skill s = new Skill(skill);
        SkillsForPersonKey sp = new SkillsForPersonKey(id, skill);
        this.skills = new HashSet<>();
        this.skills.add(new SkillsForPerson(sp, this, s, Integer.parseInt(level)));
    }

    public String getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getGender() {
        return gender;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<SkillsForPerson> getSkills() {
        return skills;
    }

    public void setSkills(Set<SkillsForPerson> skills) {
        this.skills = skills;
    }

    public List<TeacherStudents> getPupil() {
        return pupil;
    }

    public void setPupil(List<TeacherStudents> pupil) {
        this.pupil = pupil;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id='" + id + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", birthDate=" + birthDate +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", skills=" + skills +
                '}';
    }
}
