package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.Authorities;

import javax.transaction.Transactional;

public interface AuthoritiesDAO extends JpaRepository<Authorities, String> {

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO authorities (username, authority) VALUES (:username, :authority)", nativeQuery = true)
    void addAuthorities(@Param("username") String username, @Param("authority") String authority);

}
