package project.naveyosefcc.dao;

        import org.hibernate.annotations.Cascade;
        import org.hibernate.annotations.CascadeType;
        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.data.jpa.repository.Modifying;
        import org.springframework.data.jpa.repository.Query;
        import org.springframework.data.repository.query.Param;
        import project.naveyosefcc.entity.PreferableDays;
        import project.naveyosefcc.entity.Teacher;

        import javax.transaction.Transactional;
        import java.util.Date;
        import java.util.List;
        import java.util.Optional;

public interface TeacherDAO extends JpaRepository<Teacher, String> {

    @Query(value = "SELECT p.*,s.skill_name, s.level FROM person p inner join teacher t on p.id = t.teacher_id " +
            "inner join skillsforperson s on s.person_id = t.teacher_id\n" +
            "WHERE t.teacher_id NOT IN (SELECT student_id FROM student)", nativeQuery = true)
    List<Object[]> getTeachers();

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO skillsforperson (person_id, skill_name, level) VALUES (:id, :skill, :lvl)", nativeQuery = true)
    void addSkillForTeacher(@Param("id")String id, @Param("skill")String name, @Param("lvl")int lvl);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM skillsforperson WHERE person_id = :id ", nativeQuery = true)
    void deleteSkillsForTeacher(@Param("id") String id);

    @Transactional
    @Modifying
    @Cascade(CascadeType.DELETE)
    @Query("DELETE FROM Teacher t WHERE t.id = :id")
    void deleteTeacherById(@Param("id")String id);

    @Query("SELECT t FROM Teacher t WHERE t.id = :id")
    Teacher findTeacherById(@Param("id")String id);

    @Query(value = "SELECT  p.id, DATE_FORMAT(lesson_date,'%d/%m') AS lesson_date, l.skill_name, l.lesson_grade\n" +
            "FROM lesson l INNER JOIN person p on p.id = l.pupil_Id\n" +
            "WHERE l.teacher_Id = :idT AND l.pupil_Id = :idP AND (l.attendance IN(1) AND l.lesson_grade > 4) AND (YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR \n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))" +
            "ORDER BY l.lesson_date ASC;", nativeQuery = true)
    List<Object[]> setGradesChart(@Param("idT") String idT, @Param("idP") String idP);

    @Query(value = "SELECT DATE_FORMAT(lesson_date,'%d/%m/%Y') AS lesson_date, l.pupil_Id, concat(pe.first_name,' ',pe.last_name) AS pupilName, ts.hour\n"+
            "FROM lesson l inner join person pe inner join teacherstudents ts\n"+
            "WHERE l.pupil_Id=pe.id AND lesson_date BETWEEN :start_date AND :end_date AND l.teacher_Id = :teacherId AND\n" +
            "(l.attendance = '1'  OR l.attendance = '3' ) AND\n" +
            "ts.teacher_id = l.teacher_Id AND l.pupil_Id = ts.pupil_id", nativeQuery = true)
    List<Object[]> teacherLessonsReport(@Param("start_date") Date start_date, @Param("end_date")Date end_date, @Param("teacherId")String teacherId);

    @Query(value = "SELECT (count(l.lesson_Id)) as amount_of_lessons\n"+
            "FROM lesson l \n"+
            "WHERE l.teacher_Id = :teacherId AND l.lesson_date BETWEEN :start_date AND :end_date AND\n" +
            "(l.attendance = '1'  OR l.attendance = '3' )",nativeQuery = true)
    List<Object[]> totalWorkHours(@Param("start_date") Date start_date, @Param("end_date")Date end_date, @Param("teacherId")String teacherId);

    @Query(value ="SELECT DATE_FORMAT(lesson_date,'%d/%m/%Y') AS lesson_date, l.pupil_Id, concat(pe.first_name,' ',pe.last_name) AS pupilName, ts.hour\n" +
            "FROM lesson l inner join person pe inner join teacherstudents ts\n" +
            "WHERE l.pupil_Id=pe.id AND l.teacher_Id = :teacherId AND\n" +
            "ts.teacher_id = l.teacher_Id AND l.pupil_Id = ts.pupil_id AND YEARWEEK(lesson_date, 0) = YEARWEEK(CURDATE(), 0)",nativeQuery = true)
    List<Object[]> teacherWeeklySchedule(@Param("teacherId")String teacherId);

    @Query(value =  "SELECT p.id, p.first_name, p.last_name, sfp.level, pd.day, pd.start_hour, pd.finish_hour,\n" +
                    "case when (t.teacher_id in (select student_id from student)) then 'S' \n"+
                    "else 'T' \n"+
                    "end as type\n"+
                    "FROM skillsforperson sfp inner join teacher t on sfp.person_id = t.teacher_id inner join preferabledays pd on t.teacher_id = pd.id\n" +
                    " inner join person p on t.teacher_id = p.id\n" +
                    "WHERE sfp.skill_name = :subject AND pd.day = :days", nativeQuery = true)
    List<Object[]> getTeachersForScheduleBuilder(@Param("subject")String subject, @Param("days")String day);


}
