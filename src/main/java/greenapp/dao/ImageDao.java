package greenapp.dao;

import greenapp.model.photo.Image;
import greenapp.model.profile.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dmitro on 25.05.2017.
 */
public interface ImageDao extends JpaRepository<Image, Long> {
    Image findByType(String type);
     List<Image> findByProfile(Profile profile);
     Image findById(long id);

}
