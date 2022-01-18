package pl.coderslab.charity.User;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    User findByUsername(String username);
    @Query(value = "select s from User s where s.enabled=true and s.username=?1")
    User findByUsernameEnabled(String username);
    User findByEmail(String email);
    User findUserByToken(String uuid);
}

