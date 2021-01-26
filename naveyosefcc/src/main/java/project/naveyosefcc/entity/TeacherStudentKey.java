package project.naveyosefcc.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class TeacherStudentKey implements Serializable {

    private String teacher;
    private String pupil;

    public TeacherStudentKey() {
    }

    public TeacherStudentKey(String teacher, String pupil) {
        this.teacher = teacher;
        this.pupil = pupil;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getPupil() {
        return pupil;
    }

    public void setPupil(String pupil) {
        this.pupil = pupil;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TeacherStudentKey that = (TeacherStudentKey) o;
        return Objects.equals(teacher, that.teacher) &&
                Objects.equals(pupil, that.pupil);
    }

    @Override
    public int hashCode() {
        return Objects.hash(teacher, pupil);
    }
}
