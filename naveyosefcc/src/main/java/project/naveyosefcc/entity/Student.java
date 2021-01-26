package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "student")
@PrimaryKeyJoinColumn(name = "student_id")
public class Student extends Teacher {

    @Column(name = "institution")
    private String institution;

    @Column(name = "degree")
    private String degree;

    @Column(name = "volunteer_program")
    private String volunteerProgram;

    @Column(name = "coordinator_name")
    private String coordinatorName;

    @OneToMany
    @JoinColumn(name = "student_id")
    private List<StudentActivities> activities;

    public Student() {}

    public Student(String id, String firstName, String lastName, Date birthDate, String gender, String phone, String email,
                   Set<SkillsForPerson> skills, String institution, String degree, String volunteerProgram, String coordinatorName) {
        super(id, firstName, lastName, birthDate, gender, phone, email, skills);
        this.institution = institution;
        this.degree = degree;
        this.volunteerProgram = volunteerProgram;
        this.coordinatorName = coordinatorName;
    }

    //    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getVolunteerProgram() {
        return volunteerProgram;
    }

    public void setVolunteerProgram(String volunteerProgram) {
        this.volunteerProgram = volunteerProgram;
    }

    public String getCoordinatorName() {
        return coordinatorName;
    }

    public void setCoordinatorName(String coordinatorName) {
        this.coordinatorName = coordinatorName;
    }
}

