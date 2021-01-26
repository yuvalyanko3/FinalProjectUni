//package project.naveyosefcc.entity;
//
//import javax.persistence.*;
//import java.sql.Time;
//import java.util.List;
//
//@Entity
//@Table(name = "teachergroup")
//public class TeacherGroup {
//
//    @Id
//    @Column(name = "group_num")
//    private Integer groupNum;
//
//    @JoinColumn(name = "skill_name")
//    private Integer skillName;
//
//    @JoinColumn(name = "t_id", referencedColumnName = "teacher_id")
//    private String tId;
//
//    @Column(name = "day")
//    private String day;
//
//    @Column(name = "hour")
//    private Time hour;
//
//    @ManyToMany
//    @JoinTable(
//            name = "pupilingroup",
//            joinColumns = @JoinColumn(name = "groupNum"),
//            inverseJoinColumns = @JoinColumn(name = "pupilId")
//    )
//    List<Pupil> pupils;
//
//    public TeacherGroup() {}
//
//    public TeacherGroup(Integer groupNum, Integer skillName, String teacherId,
//                        String day, Time hour, List<Pupil> pupils) {
//        this.groupNum = groupNum;
//        this.skillName = skillName;
//        this.tId = teacherId;
//        this.day = day;
//        this.hour = hour;
//        this.pupils = pupils;
//    }
//
//    public Integer getGroupNum() {
//        return groupNum;
//    }
//
//    public void setGroupNum(Integer groupNum) {
//        this.groupNum = groupNum;
//    }
//
//    public Integer getSkillName() {
//        return skillName;
//    }
//
//    public void setSkillName(Integer skillName) {
//        this.skillName = skillName;
//    }
//
//    public String getTId() {
//        return tId;
//    }
//
//    public void setTId(String teacherId) {
//        this.tId = teacherId;
//    }
//
//    public String getDay() {
//        return day;
//    }
//
//    public void setDay(String day) {
//        this.day = day;
//    }
//
//    public Time getHour() {
//        return hour;
//    }
//
//    public void setHour(Time hour) {
//        this.hour = hour;
//    }
//
//    public List<Pupil> getPupils() {
//        return pupils;
//    }
//
//    public void setPupils(List<Pupil> pupils) {
//        this.pupils = pupils;
//    }
//}
