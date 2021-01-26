package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import project.naveyosefcc.entity.Person;
import project.naveyosefcc.entity.PreferableDays;

import javax.transaction.Transactional;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface PersonDAO extends JpaRepository<Person, String> {

    @Query("SELECT p FROM Person p WHERE p.id = :id")
    Person getPersonById(@Param("id") String id);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO preferabledays (id, day, start_hour, finish_hour)" +
            "VALUES (:id, :day, :start, :finish)", nativeQuery = true)
    void addPrefDay(@Param("id") String id, @Param("day") String day,
                      @Param("start")Time start, @Param("finish")Time finish);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM person WHERE id = :id", nativeQuery = true)
    void deletePersonById(@Param("id") String id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE person SET    first_name = :firstN, " +
                                        "last_name = :lastN," +
                                        "birth_date = :birth," +
                                        "gender = :gender," +
                                        "phone = :phone," +
                                        "email = :email " +
                                        "WHERE id = :id", nativeQuery = true)
    void updatePerson(@Param("id") String id, @Param("firstN") String firstN, @Param("lastN") String lastN, @Param("birth") Date birth,
                      @Param("gender") String gender, @Param("phone") String phone, @Param("email") String email);

    @Transactional
    @Modifying
    @Query(value = "UPDATE users SET password = :pass WHERE username = :id", nativeQuery = true)
    void updatePassword(@Param("id") String id, @Param("pass") String pass);

    @Transactional
    @Modifying
    @Query(value = "UPDATE person SET email = :email WHERE id = :id", nativeQuery = true)
    void updateMail(@Param("id") String id, @Param("email") String email);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO skillsforperson (person_id, skill_name, level) VALUES (:id, :skill, :lvl)", nativeQuery = true)
    void addSkill(@Param("id")String id, @Param("skill")String name, @Param("lvl")int lvl);

    @Transactional
    @Modifying
    @Query("DELETE FROM Person p WHERE p.id = :id")
    void deletePerson(@Param("id")String id);
}
