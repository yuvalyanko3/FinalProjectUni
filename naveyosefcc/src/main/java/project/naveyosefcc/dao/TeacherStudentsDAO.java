package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.dto.TeacherStudentsDTO;
import project.naveyosefcc.entity.TeacherStudents;

import javax.transaction.Transactional;
import java.sql.Time;
import java.util.List;

public interface TeacherStudentsDAO extends JpaRepository<TeacherStudents, String> {

    @Query(value =  "SELECT ts.teacher_id, ts.pupil_id, p.first_name, p.last_name, ts.day, ts.hour\n" +
                    "FROM teacherstudents ts inner join person p on ts.pupil_id = p.id\n" +
                    "WHERE ts.skill = :subject", nativeQuery = true)
    List<Object[]> getTeacherStudentAssigning(@Param("subject")String subject);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO teacherstudents(teacher_id, pupil_id, day, hour, skill) VALUES (:tId, :pId, :lDay, :lHour, :skill)", nativeQuery = true)
    void addTeacherStudentRelation(@Param("tId")String teacherId, @Param("pId")String pupilId,
                                   @Param("lDay")String day, @Param("lHour")Time hour, @Param("skill")String skill);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM teacherstudents WHERE    teacher_id = :tId " +
                                                        "AND pupil_id = :pId " +
                                                        "AND skill = :skill " +
                                                        "AND day = :lDay", nativeQuery = true)
    void removeTeacherStudentRelation(@Param("tId")String teacherId, @Param("pId")String pupilId,
                                      @Param("skill")String skill, @Param("lDay")String day);

    @Query(value =  "SELECT ts.teacher_id, p.first_name, p.last_name, ts.day, ts.hour\n" +
                    "FROM teacherstudents ts inner join person p on ts.pupil_id = p.id\n" +
                    "where ts.teacher_id = :tId", nativeQuery = true)
    List<Object[]> getTeacherStudentDTO(@Param("tId")String teacherId);
}
