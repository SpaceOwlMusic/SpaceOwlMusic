package greenapp.dao;

import greenapp.model.profile.Profile;
import greenapp.model.sound.Playlist;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dmitro on 29.05.2017.
 */
public interface PlaylistDao extends JpaRepository<Playlist,Long> {
    Playlist findById(long id);
    List<Playlist> findByProfile(Profile profile);
    Playlist findByTypeAndProfile(String type,Profile profile);
    void removeById(long id);



}
