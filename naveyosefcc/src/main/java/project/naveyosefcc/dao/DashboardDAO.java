package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.naveyosefcc.entity.Teacher;

import java.util.List;

public interface DashboardDAO extends JpaRepository<Teacher, String> {

    @Query(value = "SELECT skp.skill_name as skill_name, count(distinct skp.person_id) as count_teachers\n" +
            " FROM skillsforperson skp inner join teacher t on t.teacher_id = skp.person_id\n" +
            " group by skp.skill_name", nativeQuery = true)
    List<Object[]> getNumOfTeachersBySkill();

    @Query(value = " SELECT volunteer_program, count(distinct student_id)\n" +
            " from student \n" +
            " group by volunteer_program", nativeQuery = true)
    List<Object[]> getNumOfStudentsByProgram();

    @Query(value = "SELECT YEAR(l.lesson_date), MONTH(l.lesson_date), CAST(avg(l.lesson_grade) AS DECIMAL(10,1))\n" +
            "FROM lesson l \n" +
            "Group by MONTH(l.lesson_date), YEAR(l.lesson_date)\n" +
            "order by MONTH(l.lesson_date) asc", nativeQuery = true)
    List<Object[]> getAVGradesByYearAndMonth();

    @Query(value = "SELECT concat(p.first_name,' ',p.last_name) AS teacherName, avg(l.lesson_grade)\n" +
            "FROM lesson l INNER JOIN teacher t on t.teacher_id = l.teacher_Id\n" +
            "INNER JOIN person p ON p.id = t.teacher_id \n" +
            "WHERE t.teacher_id = l.teacher_Id AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)\n" +
            "and t.teacher_id NOT IN (SELECT student_id FROM student)\n" +
            "group by l.teacher_id", nativeQuery = true)
    List<Object[]> getAVGradesByTeachers();

    @Query(value = "SELECT skp.skill_name, count(distinct skp.person_id)\n" +
            " FROM skillsforperson skp inner join pupil p on p.pupil_id = skp.person_id\n" +
            " group by skp.skill_name", nativeQuery = true)
    List<Object[]> getNumOfPupilsBySkills();

    @Query(value = " SELECT count(pupil_id) as numOfPupil, \n" +
            " CASE\n" +
            "    WHEN (YEAR(CURDATE()) - YEAR(pe.birth_date)) < 13 THEN \"יסודי\"\n" +
            "    WHEN (YEAR(CURDATE()) - YEAR(pe.birth_date)) < 15 and (YEAR(CURDATE()) - YEAR(pe.birth_date)) > 12 THEN \"חטיבה\"\n" +
            "    WHEN (YEAR(CURDATE()) - YEAR(pe.birth_date)) > 15 and (YEAR(CURDATE()) - YEAR(pe.birth_date)) < 19 THEN \"תיכון\"\n" +
            "    ELSE \"בוגרים\"\n" +
            "END AS ageGroup\n" +
            " FROM pupil pu join person pe on pu.pupil_id = pe.id \n" +
            " group by ageGroup", nativeQuery = true)
    List<Object[]> getNumOfPupilsByAgeGroup();

    @Query(value = " SELECT attendance, count(pupil_ID) as numOfPupils\n" +
            " FROM lesson l \n" +
            " WHERE YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR \n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH))\n"+
            " GROUP BY attendance\n" +
            " ORDER BY attendance", nativeQuery = true)
    List<Object[]> getNumOfPupilsByAttendance();

    @Query(value = "SELECT  tmp.numOfClasses, count(tmp.pupil_id)\n" +
            "FROM (SELECT p.pupil_id, count(l.lesson_Id),\n" +
            "CASE \n" +
            "  WHEN (40 - count(l.lesson_Id)) < 11 THEN \"0-10\"\n" +
            "  WHEN (40 - count(l.lesson_Id)) > 10 and (40 - count(l.lesson_Id)) < 21 THEN \"10-20\"\n" +
            "  WHEN (40 - count(l.lesson_Id)) > 20 and (40 - count(l.lesson_Id)) < 31 THEN \"20-30\"\n" +
            "ELSE \"30-40\"\n" +
            "END AS numOfClasses\n" +
            " FROM lesson l right join pupil p on p.pupil_id = l.pupil_Id\n" +
            "WHERE YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR\n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH))\n"+
            " GROUP BY p.pupil_id) as tmp\n"+
            " GROUP BY tmp.numOfClasses", nativeQuery = true)
    List<Object[]> getNumOfPupilsByNumOfClasses();

    @Query (value = " select concat(p.first_name,' ',p.last_name) as fullName, CAST(avg(l.lesson_grade) AS DECIMAL(10,1)), l.skill_name\n" +
            " from lesson l  join person p on p.id = l.pupil_Id\n" +
            "WHERE YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR \n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH))\n"+
            "  GROUP BY fullName\n" +
            "  order by CAST(avg(l.lesson_grade) AS DECIMAL(10,1)) desc\n" +
            "  LIMIT 3", nativeQuery = true)
    List<Object[]> getTOP3ofPupilsByAVG();

    @Query (value = " select concat(p.first_name,' ',p.last_name) as fullName, CAST(avg(l.lesson_grade) AS DECIMAL(10,1)), l.skill_name\n" +
            "from lesson l  join person p on p.id = l.pupil_Id\n" +
            "WHERE YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR \n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH))\n" +
            "GROUP BY fullName\n" +
            "order by CAST(avg(l.lesson_grade) AS DECIMAL(10,1)) asc\n" +
            "LIMIT 3 ", nativeQuery = true)
    List<Object[]> getLAST3ofPupilsByAVG();

    @Query(value = " SELECT distinct volunteer_program\n" +
            " from student ", nativeQuery = true)
    List<Object[]> getPrograms();

    @Query(value = "SELECT l.lesson_grade, count( distinct l.pupil_Id)\n" +
            "FROM lesson l \n" +
            "WHERE l.lesson_grade > 4 AND (YEAR(l.lesson_date) = YEAR(CURRENT_DATE - INTERVAL 6 MONTH) OR \n" +
            "      ((CONCAT(MONTH(l.lesson_date)) between 1 and 7) AND YEAR(l.lesson_date) = YEAR(CURRENT_DATE + INTERVAL 6 MONTH)))\n" +
            "group by l.lesson_grade", nativeQuery = true)
    List<Object[]> getNumOfPupilsByGrades();
}
