package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.PreferableDays;

import javax.transaction.Transactional;
import java.util.List;

public interface PreferableDaysDAO extends JpaRepository<PreferableDays, Integer> {

    @Query("SELECT DISTINCT p FROM PreferableDays p WHERE p.id = :id")
    List<PreferableDays> findById(@Param("id") String Id);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM preferabledays WHERE id = :id", nativeQuery = true)
    void deleteByPersonId(@Param("id")String id);

}
