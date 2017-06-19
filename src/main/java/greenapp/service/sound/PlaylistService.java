package greenapp.service.sound;

import greenapp.model.profile.Profile;
import greenapp.model.sound.Audio;
import greenapp.model.sound.Playlist;
import greenapp.model.user.User;

import java.util.List;

/**
 * Created by Dmitro on 31.05.2017.
 */
public interface PlaylistService {
    public Playlist save(Playlist playlist);
    public Playlist getPlaylistById(long id);
    public List<Playlist> getAllPlaylists(Profile profile);
    public List<Playlist> getAllPlaylists();
    public Playlist getDefaultPlaylist();
    public Playlist getUserDefaultPlaylist(User user);
    public void remove(long id);
    public void removeSongFromPlaylist(Playlist playlist, Audio sound);

}
