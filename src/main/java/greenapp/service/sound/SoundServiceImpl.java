package greenapp.service.sound;

import greenapp.dao.MapperSoundDao;
import greenapp.dao.PlaylistDao;
import greenapp.dao.SoundDao;
import greenapp.model.sound.*;
import greenapp.utils.TagsUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.List;
import java.util.Set;

/**
 * Created by Dmitro on 27.05.2017.
 */
@Service
public class SoundServiceImpl implements SoundService {
    @Autowired
    SoundDao soundDao;
    @Autowired
    MapperSoundDao mapperSoundDao;
    @Autowired
    PlaylistDao playlistDao;


    @Override
    public String[] addSound(byte[] soundByte, Playlist playlist) throws IOException {
        String newPath = saveSoundForHard(soundByte);
        MapperSounds mapperSounds = new MapperSounds();
        mapperSounds.setName("sound" + mapperSoundDao.findAll().size());
        mapperSounds.setPath(newPath);
        mapperSoundDao.save(mapperSounds);
        Audio audio = new Audio();
        //aSound sound = new Sound();
        audio.setMapperSounds(mapperSounds);
        audio = TagsUtil.getSoundMetaData(audio);
        if (audio.getTitle() == null)
            audio.setTitle("title sound test" + mapperSoundDao.findAll().size());

        audio.setUrl("http://localhost:8080/greenapp/api/sound/" + mapperSounds.getName());
        audio = soundDao.save(audio);
        playlist.add(audio);

        String[] url_name = new String[3];
        url_name[0] = "http://localhost:8080/greenapp/api/sound/" + mapperSounds.getName();
        url_name[1] = audio.getTitle();
        url_name[2] = String.valueOf(audio.getId());
        return url_name;
    }

    @Override
    public void addSoundInAlbum(Audio sound) {

    }

    @Override
    public long countSound() {
        return 0;
    }


    @Override
    public byte[] getSoundByName(String name) {
        MapperSounds mapperSounds = mapperSoundDao.findByName(name);
        InputStream in = null;
        byte[] bytes = null;
        try {
            in = new FileInputStream(mapperSounds.getPath());
            bytes = IOUtils.toByteArray(in);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bytes;
    }

    @Override
    public Audio getSoundById(long id) {
        Audio sound = soundDao.findById(id);
        return sound;
    }

    @Override
    public List<Audio> getSoundsWithDefaultAlbum() {
        return null;
    }

    private String saveSoundForHard(byte[] bytes) {
        int postfix = mapperSoundDao.findAll().size();
        try (FileOutputStream fos = new FileOutputStream("D:/sound_memory/sound" + postfix + ".mp3")) {
            fos.write(bytes, 0, bytes.length);
        } catch (IOException ex) {
            //  System.out.println(ex.getMessage());
        }
        return "D:/sound_memory/sound" + postfix + ".mp3";
    }
}
