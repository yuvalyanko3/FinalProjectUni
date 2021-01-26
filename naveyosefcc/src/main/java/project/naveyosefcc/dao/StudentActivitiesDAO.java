package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.StudentActivities;

import javax.transaction.Transactional;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface StudentActivitiesDAO extends JpaRepository<StudentActivities, Date> {

    @Query(value =  "SELECT sa.act_Date, sa.start_hour, sa.finish_hour, IFNULL(sa.act_desc, '') as 'act_desc'\n" +
                    "FROM studentactivities sa\n" +
                    "WHERE sa.student_Id = :sId AND MONTH(sa.act_Date) = MONTH(NOW())", nativeQuery = true)
    List<StudentActivities> getMonthlyActivities(@Param("sId") String studentId);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO studentactivities VALUES (:actDate, :sId, :startT, :endT, :actDesc)", nativeQuery = true)
    void addActivity(@Param("actDate")Date date, @Param("sId")String studentId, @Param("startT")Time startTime,
                     @Param("endT")Time endTime, @Param("actDesc") String description);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM studentactivities WHERE act_Date = :actDate AND student_Id = :sId", nativeQuery = true)
    void deleteHourReport(@Param("actDate")Date date, @Param("sId")String studentId);
}
