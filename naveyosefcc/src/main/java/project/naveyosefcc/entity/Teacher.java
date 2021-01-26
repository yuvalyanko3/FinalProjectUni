package project.naveyosefcc.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "teacher")
@PrimaryKeyJoinColumn(name = "teacher_id")
public class Teacher extends Person {

//    @OneToMany
//    @JoinColumn(name = "t_id", referencedColumnName = "teacher_id")
//    List<TeacherGroup> groups;

    public Teacher(Object[] obj){
        super((String)obj[0],(String)obj[1],(String)obj[2],(Date)obj[3],(String)obj[4],(String)obj[5],(String)obj[6],(String)obj[7],String.valueOf(obj[8]));
    }

    public Teacher() {}

    public Teacher(String id) {
        super(id);
    }

    public Teacher(String id, String firstName, String lastName, Date birthDate, String gender, String phone, String email, Set<SkillsForPerson> skills) {
        super(id, firstName, lastName, birthDate, gender, phone, email, skills);
    }

    public void addSkill (String skill, String level){
        Skill s = new Skill(skill);
        SkillsForPersonKey sp = new SkillsForPersonKey(this.getId(), skill);
        this.skills.add(new SkillsForPerson(sp, this, s, Integer.parseInt(level)));
    }
//    public List<TeacherGroup> getGroups() {
//        return groups;
//    }

//    public void setGroups(List<TeacherGroup> groups) {
//        this.groups = groups;
//    }
}
