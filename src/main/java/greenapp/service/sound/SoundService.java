package greenapp.service.sound;

import greenapp.model.sound.Audio;
import greenapp.model.sound.Playlist;

import java.io.IOException;
import java.util.List;

/**
 * Created by Dmitro on 27.05.2017.
 */
public interface SoundService {
    public String[] addSound(byte[] sound, Playlist playlist) throws IOException;

    public void addSoundInAlbum(Audio sound);

    public long countSound();

    public byte[] getSoundByName(String name);

    public Audio getSoundById(long id);

    public List<Audio> getSoundsWithDefaultAlbum();
}
