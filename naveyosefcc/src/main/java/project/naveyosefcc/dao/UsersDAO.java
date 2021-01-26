package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import project.naveyosefcc.entity.User;

import javax.transaction.Transactional;

public interface UsersDAO extends JpaRepository<User, String> {

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO users (username, password, enabled) VALUES (:username, :password, 1)", nativeQuery = true)
    void addUser(@Param("username") String username, @Param("password") String password);

}
