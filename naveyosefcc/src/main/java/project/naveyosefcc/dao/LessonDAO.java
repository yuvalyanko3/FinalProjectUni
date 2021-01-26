package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.Lesson;

import javax.transaction.Transactional;
import java.sql.Date;
import java.util.List;

public interface LessonDAO extends JpaRepository<Lesson, Integer> {

    @Query(value =  "SELECT l.pupil_Id, l.teacher_Id, concat(p.first_name,' ',p.last_name) as 'teacher_name', l.skill_name, DATE_FORMAT(l.lesson_date,'%d/%m/%Y') as lesson_date, l.attendance, \n" +
            "IFNULL(l.lesson_description, '') as 'lesson_description', l.lesson_grade, IFNULL(l.notes, '') as 'notes' \n"+
            "FROM lesson l inner join person p on l.teacher_Id = p.id\n"+
            "WHERE l.pupil_Id = :id AND\n" +
            "            (((CONCAT(MONTH(l.lesson_date)) between 9 and 12) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH))\n" +
            "    OR ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))\n"+
            "ORDER BY l.lesson_date DESC;", nativeQuery = true)
    List<Object[]> getPupilLessons(@Param("id") String id);


    @Query(value =  "SELECT ts.teacher_id, p.first_name, p.last_name, ts.day, LEFT(ts.hour,5) as hour, ts.skill, l.lesson_grade, IFNULL(l.notes, 'לא צויינו') as 'notes', tmp.lastLess\n" +
            "FROM teacherstudents ts inner join lesson l on ts.teacher_Id = l.teacher_Id AND ts.pupil_Id = l.pupil_Id inner join person p on ts.pupil_Id = p.id\n" +
            "inner join (select l.teacher_Id, l.pupil_Id, l.skill_name, max(l.lesson_date) as lastLess\n" +
            "            from lesson l \n" +
            "            where l.attendance = 1 AND l.teacher_Id = :id AND (((CONCAT(MONTH(l.lesson_date)) between 9 and 12) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH)) \n" +
            "            OR ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))\n" +
            "            group by l.teacher_Id, l.pupil_Id, l.skill_name) as tmp on ts.teacher_Id = tmp.teacher_Id AND ts.pupil_Id = tmp.pupil_Id AND\n" +
            "            l.lesson_date = tmp.lastLess AND ts.skill = tmp.skill_name \n" +
            "order by ts.day, hour", nativeQuery = true)
    List<Object[]> getNextLessons(@Param("id") String id);

    @Query(value =  "SELECT l.pupil_Id, SUM(case when l.attendance IN (2,4,5) then 1 else 0 end) as justified,\n" +
                                        "SUM(case when l.attendance IN (1) then 1 else 0 end) as present,\n" +
                                        "SUM(case when l.attendance IN (3) then 1 else 0 end) as unjustified,  \n" +
                                        "count(l.pupil_Id) as 'all'\n" +
                    "FROM lesson l\n" +
                    "WHERE l.pupil_Id = :id AND (((CONCAT(MONTH(l.lesson_date)) between 9 and 12) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH)) OR ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))\n" +
                    "GROUP BY l.pupil_Id;", nativeQuery = true)
    List<Object[]> getAttendanceSum(@Param("id") String id);

    @Query(value =  "select l.lesson_Id, l.skill_name, DATE_FORMAT(l.lesson_date,'%d/%m/%Y') as lesson_date, l.attendance, IFNULL(l.lesson_description, '') as 'lesson_description', l.lesson_grade, IFNULL(l.notes, '') as 'notes'\n" +
                    "from lesson l \n" +
                    "where (l.teacher_Id = :tId AND l.pupil_Id = :pId) AND \n" +
            "(((CONCAT(MONTH(l.lesson_date)) between 9 and 12) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH)) OR\n" +
            "            ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))\n"+
            "ORDER BY l.lesson_date DESC;", nativeQuery = true)
    List<Object[]> getTeacherPupilLessons(@Param("tId") String teacherId, @Param("pId") String pupilId);


    @Query(value =  "select lesson_Id\n" +
                    "from lesson l\n" +
                    "where l.teacher_Id = :tId AND l.pupil_Id = :pId\n" +
                    "order by lesson_id desc\n" +
                    "limit 1", nativeQuery = true)
    Integer getLastLessonId(@Param("tId")String teacherId, @Param("pId")String pupilId);

    @Transactional
    @Modifying
    @Query(value =  "INSERT INTO lesson(lesson_Id, teacher_Id, pupil_Id, skill_name, lesson_date, attendance, lesson_description, lesson_grade, notes)\n" +
                    "VALUES (:lId, :tId, :pId, :subject, :date, :attendance, :desc, :grade, :notes)", nativeQuery = true)
    void addLesson(@Param("lId")Integer lessonId, @Param("tId")String teacherId, @Param("pId")String pupilId, @Param("subject")String subject,
                    @Param("date")Date date, @Param("attendance")Integer attendance, @Param("desc")String description,
                    @Param("grade")Integer grade, @Param("notes") String notes);

}
