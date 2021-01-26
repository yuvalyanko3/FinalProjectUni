package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.Student;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

public interface StudentDAO extends JpaRepository<Student, String> {

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM skillsforperson WHERE person_id = :id ", nativeQuery = true)
    void deleteSkillsForStudent(@Param("id") String id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE student SET institution = :institution, " +
                                        "degree = :degree," +
                                        "volunteer_program = :program," +
                                        "coordinator_name = :coordinator " +
                                        "WHERE (student_id = :id)", nativeQuery = true)
    void updateStudent(@Param("id")String id,@Param("institution")String institution, @Param("degree")String degree,
                       @Param("program")String program, @Param("coordinator")String coordinator);


    @Transactional
    @Modifying
    @Query(value = "SELECT DATE_FORMAT(act_date,'%d/%m/%Y') AS act_date, concat(person.first_name,' ',person.last_name) AS StudentName, st.volunteer_program, sa.start_hour, sa.finish_hour,\n" +
            "timediff(sa.finish_hour , sa.start_hour) as totalho, sa.student_Id\n" +
            "FROM studentactivities sa inner join student st on sa.student_Id = st.student_id inner join person on sa.student_Id=person.id\n" +
            "WHERE  sa.student_Id=:student_id AND sa.act_date BETWEEN :start_date AND :end_date",nativeQuery = true)
    List<Object[]> StudentLessonsReport(@Param("start_date")Date start_date, @Param("end_date")Date end_date, @Param("student_id")String student_id);


   // @Transactional
   // @Modifying
   // @Query(value = "SELECT actDate, studentId, concat(pe.first_name,'  ',pe.last_name) AS StudentName, st.volunteer_program, sa.start_hour, sa.finish_hour,\n" +
  //          "timediff(sa.finish_hour , sa.start_hour) as totalho\n" +
  //          "FROM studentactivities sa inner join person pe join student st\n" +
   //         "WHERE sa.studentId=pe.id AND st.student_id=:student_id AND actDate BETWEEN :start_date AND :end_date AND sa.studentId = :student_id ;",nativeQuery = true)
  //  List<Object[]> StudentLessonsReport(@Param("start_date")Date start_date, @Param("end_date")Date end_date, @Param("student_id")String student_id);

}
