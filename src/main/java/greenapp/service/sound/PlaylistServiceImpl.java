package greenapp.service.sound;

import greenapp.dao.PlaylistDao;
import greenapp.model.profile.Profile;
import greenapp.model.sound.Audio;
import greenapp.model.sound.Playlist;
import greenapp.model.user.User;
import greenapp.service.profile.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * Created by Dmitro on 31.05.2017.
 */
@Service
public class PlaylistServiceImpl implements PlaylistService {
    @Autowired
    PlaylistDao playlistDao;
    @Autowired
    ProfileService profileService;

    @Override
    public Playlist save(Playlist playlist) {
        return playlistDao.save(playlist);

    }

    @Override
    public Playlist getPlaylistById(long id) {
        return playlistDao.findById(id);
    }

    @Override
    public List<Playlist> getAllPlaylists(Profile profile) {
        return playlistDao.findByProfile(profile);
    }


    @Override
    public List<Playlist> getAllPlaylists() {
        return playlistDao.findAll();
    }

    @Override
    public Playlist getDefaultPlaylist() {

        Playlist playlist = playlistDao.findByTypeAndProfile("default", profileService.getCurrentProfile());
        return playlist;
    }

    @Override
    public Playlist getUserDefaultPlaylist(User user) {
        Playlist playlist = playlistDao.findByTypeAndProfile("default", user.getProfile());
        return playlist;
    }

    @Override
    @Transactional
    public void remove(long id) {
        playlistDao.removeById(id);
    }

    @Override
    public void removeSongFromPlaylist(Playlist playlist, Audio audio) {
        //переробити БИДЛО_КОД
        Set<Audio> audioList = playlist.getSounds();
        for (Audio a : audioList) {
            if (a.getId().equals(audio.getId())) {
                audioList.remove(a);
                break;
            }

        }
        playlist.setSounds(audioList);
        playlistDao.save(playlist);
        int d = 4;

    }
}
