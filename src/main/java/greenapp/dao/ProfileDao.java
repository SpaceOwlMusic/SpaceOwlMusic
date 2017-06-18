package greenapp.dao;

import greenapp.model.photo.Image;
import greenapp.model.profile.Profile;
import greenapp.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dmitro on 25.05.2017.
 */
public interface ProfileDao extends JpaRepository<Profile,Long> {
    Profile findByUser(User user);
}
