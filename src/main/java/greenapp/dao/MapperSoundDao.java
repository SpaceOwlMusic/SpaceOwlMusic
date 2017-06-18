package greenapp.dao;

import greenapp.model.sound.MapperSounds;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Dmitro on 27.05.2017.
 */
public interface MapperSoundDao extends JpaRepository<MapperSounds,Long> {
    MapperSounds findByName(String name);
}
