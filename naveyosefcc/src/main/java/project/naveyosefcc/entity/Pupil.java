package project.naveyosefcc.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "pupil")
@PrimaryKeyJoinColumn(name = "pupil_id")
public class Pupil extends Person {

    @Column(name = "parent_phone")
    private String parentPhone;

    @Column(name = "school_name")
    private String schoolName;

    @Column(name = "class")
    private String pupilClass;

    @Column(name = "teacher_school_name")
    private String teacherSchoolName;

    @Column(name = "teacher_school_phone")
    private String teacherPhone;

    @Column(name = "hours_to_add")
    private String hoursToAdd;

//    @ManyToMany
//    @JoinTable(
//            name = "pupilingroup",
//            joinColumns = @JoinColumn(name = "pupilId"),
//            inverseJoinColumns = @JoinColumn(name = "groupNum")
//    )
//    List<TeacherGroup> pupilGroups;

    @OneToMany(mappedBy = "pupil")
    List<TeacherStudents> teachers;

    public Pupil() {}

    public Pupil(String pupilId, String parentPhone, String schoolName,
                 String pupilClass, String teacherSchool, String teacherPhone) {
        this.parentPhone = parentPhone;
        this.schoolName = schoolName;
        this.pupilClass = pupilClass;
        this.teacherSchoolName = teacherSchool;
        this.teacherPhone = teacherPhone;
//        this.pupilGroups = pupilGroups;
    }

    public Pupil(String pupilId, String firstName, String lastName, Date birthDate, String gender, String phone, String parantEmail,
                 Set<SkillsForPerson> skills,String pupilClass, String schoolName, String teacherSchool, String teacherPhone,String parentPhone) {
        super(pupilId, firstName, lastName, birthDate, gender, phone, parantEmail,skills);
        this.parentPhone = parentPhone;
        this.schoolName = schoolName;
        this.pupilClass = pupilClass;
        this.teacherSchoolName = teacherSchool;
        this.teacherPhone = teacherPhone;
        this.hoursToAdd = String.valueOf(0);

//        this.pupilGroups = pupilGroups;
    }

    public String getParentPhone() {
        return parentPhone;
    }

    public void setParentPhone(String parentPhone) {
        this.parentPhone = parentPhone;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getPupilClass() {
        return pupilClass;
    }

    public void setPupilClass(String pupilClass) {
        this.pupilClass = pupilClass;
    }

    public String getTeacherSchoolName() {
        return teacherSchoolName;
    }

    public void setTeacherSchoolName(String teacherSchool) {
        this.teacherSchoolName = teacherSchool;
    }

    public String getTeacherPhone() {
        return teacherPhone;
    }

    public void setTeacherPhone(String teacherPhone) {
        this.teacherPhone = teacherPhone;
    }

    public String getHoursToAdd() { return hoursToAdd; }

    public void setHoursToAdd(String hoursToAdd) { this.hoursToAdd = hoursToAdd; }
}
