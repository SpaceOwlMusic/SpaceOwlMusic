package greenapp.dao;

import greenapp.model.photo.Image;
import greenapp.model.photo.MapperImage;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dmitro on 25.05.2017.
 */
public interface MapperImageDao extends JpaRepository<MapperImage, Long> {

}
