package greenapp.dao;

import greenapp.model.sound.Audio;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dmitro on 27.05.2017.
 */
public interface SoundDao extends JpaRepository<Audio,Long>{
    Audio findById(long id);

}
