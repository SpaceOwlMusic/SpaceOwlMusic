package greenapp.dao;


import greenapp.model.profile.Profile;
import greenapp.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User, Long> {
    User findByUsername(String username);

}
