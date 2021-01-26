package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.*;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;


public interface PupilDAO extends JpaRepository<Pupil, String>{

    @Query(value =   "SELECT p.id, l.lesson_date, l.lesson_grade\n"
                    +"FROM Lesson l INNER JOIN Person p on p.id = l.pupil_Id \n"
                    +"WHERE l.teacher_Id = :id AND (l.attendance IN(1)) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) \n"
                    +"AND MONTH(l.lesson_date) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);", nativeQuery = true)
    Map<String, Map<Date,String>> pupilGradesChart(@Param("id") String Id);


    @Query(value =  "select p.pupil_id, (40-count(tmp.lesson_Id))\n" +
                    "from ( select l.* from lesson l where ((CONCAT(MONTH(l.lesson_date)) between 9 and 12) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH)) OR\n" +
                    "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH))) as tmp right join pupil p on p.pupil_id = tmp.pupil_Id\n" +
                    "group by p.pupil_id;", nativeQuery = true)
    List<Object[]> amountOfLessonsPerPupil();


    @Query(value =  "SELECT p.first_name, p.last_name, ts.day, ts.hour\n" +
                    "FROM teacherstudents ts inner join person p on ts.teacher_id = p.id\n" +
                    "where ts.pupil_id = :id", nativeQuery = true)
    List<Object[]> getPupilSchedule(@Param("id") String id);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM skillsforperson WHERE person_id = :id ", nativeQuery = true)
    void deleteSkillsForPupil(@Param("id") String id);

    @Query("SELECT p FROM Pupil p WHERE p.id = :id")
    Pupil findPupilById(@Param("id")String id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE pupil p SET hours_to_add = :hours WHERE (p.pupil_id = :id)",nativeQuery = true)
    void addHours(String id, int hours);

    @Transactional
    @Modifying
    @Query(value =  "UPDATE pupil SET parent_phone = :parentPhone, " +
                    "school_name = :school," +
                    "class = :pupilClass," +
                    "teacher_school_name = :schoolTeacher," +
                    "teacher_school_phone = :phoneTeacher " +
                    "WHERE (pupil_id = :id)", nativeQuery = true)
    void updatePupil(@Param("id") String id, @Param("parentPhone") String parentPhone, @Param("pupilClass") String pupilClass,
                      @Param("school") String school, @Param("schoolTeacher") String schoolTeacher,@Param("phoneTeacher") String phoneTeacher);

    @Query(value =  "SELECT p.id, p.first_name, p.last_name, sfp.level, pd.day, pd.start_hour, pd.finish_hour\n" +
                    "FROM skillsforperson sfp inner join pupil pu on sfp.person_id = pu.pupil_id join preferabledays pd on pu.pupil_id = pd.id\n" +
                    "inner join person p on pu.pupil_id = p.id\n" +
                    "WHERE sfp.skill_name = :subject", nativeQuery = true)
    List<Object[]> getPupilsForScheduleBuilder(@Param("subject")String subject);

    @Query(value =  "SELECT p.id, p.first_name, p.last_name, sfp.level, pd.day, pd.start_hour, pd.finish_hour\n" +
                    "FROM skillsforperson sfp inner join pupil pu on sfp.person_id = pu.pupil_id join preferabledays pd on pu.pupil_id = pd.id\n" +
                    "inner join person p on pu.pupil_id = p.id\n" +
                    "WHERE sfp.skill_name = :subject AND pu.pupil_id NOT IN (SELECT ts.pupil_id\n" +
                                                                            "FROM teacherstudents ts inner join person p on ts.pupil_id = p.id\n" +
                                                                            "WHERE ts.skill = :subject)", nativeQuery = true)
    List<Object[]> getUnassignedPupils(@Param("subject")String subject);

}
