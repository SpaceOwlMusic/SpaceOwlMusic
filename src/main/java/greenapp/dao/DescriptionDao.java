package greenapp.dao;

import greenapp.model.profile.Description;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dmitro on 03.06.2017.
 */
public interface DescriptionDao extends JpaRepository<Description,Long> {
}
