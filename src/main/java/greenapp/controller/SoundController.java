package greenapp.controller;

import greenapp.dao.PlaylistDao;
import greenapp.model.photo.Image;
import greenapp.model.sound.Audio;
import greenapp.model.sound.Playlist;
import greenapp.service.image.ImageService;
import greenapp.service.sound.PlaylistService;
import greenapp.service.sound.SoundService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Dmitro on 28.05.2017.
 */
@Controller
public class SoundController {

    @Autowired
    ImageService imageService;

    @Autowired
    PlaylistService playListService;

    @Autowired
    UserService userService;

    @Autowired
    SoundService soundService;

    @Autowired
    PlaylistDao playlistDao;

    @RequestMapping(value = "/{username}/sound", method = RequestMethod.GET)
    public String sound(Model model, @PathVariable(value = "username") String username,HttpServletRequest request) {
        if (!username.equals(userService.getCurrentUser().getUsername())) {
            Playlist playlist = playListService.getUserDefaultPlaylist(userService.findByUsername(username));
            model.addAttribute("username", username);
            model.addAttribute("sounds", playlist);
            model.addAttribute("playlists", playListService.getAllPlaylists(userService.findByUsername(username).getProfile()));
            return "userMusic";
        } else {
            Playlist playlist = playListService.getDefaultPlaylist();
            //при переході на сторін sound  зберігаємо id дефолтного альбома
            request.getSession().setAttribute("id_playlist", playlist.getId());
            model.addAttribute("username", username);
            model.addAttribute("sounds", playlist);
            model.addAttribute("playlists", playListService.getAllPlaylists(userService.getCurrentUser().getProfile()));
            return "mymusic";
        }
    }

    //загрузка декількох пісень в плейст по його id
    @RequestMapping(value = "api/playlist/putSounds", method = RequestMethod.POST, produces = {"application/json"})
    public @ResponseBody
    List<HashMap<String, String>> createPlaylist(@RequestParam("fileaudio") List<MultipartFile> arrMmultipartFile, HttpServletRequest request) throws Exception {
        int id = (int) request.getSession().getAttribute("id_playlist");

        List<HashMap<String, String>> arrayList = new ArrayList<>();

        Playlist playlist = playListService.getPlaylistById(id);


        //зберігаю на хард музику, при чому в обекті плейліс добавляю їх
        for (int i = 0; i < arrMmultipartFile.size(); i++) {
            String[] path_name = soundService.addSound(arrMmultipartFile.get(i).getBytes(),playlist);
            HashMap<String, String> h = new HashMap<>();
            h.put("path", path_name[0]);
            h.put("name", path_name[1]);
            arrayList.add(h);
        }
        //зберігаю зміни в бд
        playlistDao.save(playlist);


        return arrayList;
    }

    //create playlist
    @RequestMapping(value = "/{username}/playlist/", method = RequestMethod.POST, produces = {"application/json"})
    public @ResponseBody
    String createFolder(@RequestParam Map<String, String> map, HttpServletRequest httpServletRequest, @PathVariable(value = "username") String username) throws Exception {
        Image image = imageService.getImageById(Integer.parseInt(map.get("image_id")));

        Playlist playlist = new Playlist();
        playlist.setCover(image);
        playlist.setTitle(map.get("name"));
        playlist.setDescription(map.get("description"));
        playlist.setProfile(userService.getCurrentUser().getProfile());
        playlist.setAccess("all");
        playlist = playListService.save(playlist);
        //повертаємо шлях до плейлиста
        return "{ \"path\":\"" + httpServletRequest.getRequestURL().toString() + playlist.getId() + "\"}";
    }


    //видалення альбома
    @RequestMapping(value = "api/playlist/remove", method = RequestMethod.POST, produces = {"application/json"})
    public @ResponseBody
    String removePlaylist(@RequestParam(value = "id_playlist") String id_playlist) throws Exception {
        playListService.remove(Long.parseLong(id_playlist));
        return "{ \"response\":\"" + "good" + "\"}";
    }


    //видалиння пісні із  альбома
    @RequestMapping(value = "api/playlist/sound/remove", method = RequestMethod.POST, produces = {"application/json"})
    public @ResponseBody
    String removeSound(@RequestParam(value = "id_sound") String idSound,HttpServletRequest request) throws Exception {
        //переробити костилі із hashcode
         long id = (long) request.getSession().getAttribute("id_playlist");

        Playlist playlist = playListService.getPlaylistById(id);
        Audio audio = playlist.getAudioById(Long.parseLong(idSound));
        playListService.removeSongFromPlaylist(playListService.getDefaultPlaylist(), audio);
        return "{ \"response\":\"" + "good" + "\"}";
    }





    //повернення сторінки плейлиста
    @RequestMapping(value = "/{username}/playlist/{playlist}", method = RequestMethod.GET)
    public String plylist(Model model, @PathVariable(value = "playlist") String playlist, @PathVariable(value = "username") String username, HttpServletRequest request) {
        request.getSession().setAttribute("id_playlist", Integer.parseInt(playlist));
        model.addAttribute("playlist", playlist);
        Playlist playlists = playListService.getPlaylistById(Integer.parseInt(playlist));
        if (playlists == null) return "notFound";
        model.addAttribute("sound", playlists);
        return "playlist";
    }


    //отримання аудіо
    @RequestMapping(value = "/api/sound/{sound_id}", method = RequestMethod.GET, produces = {"application/json"})
    public @ResponseBody
    HttpEntity<byte[]> sound(@PathVariable(value = "sound_id") String sound_id) {
        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("audio", "mp3"));
        byte[] sound = soundService.getSoundByName(sound_id);
        return new HttpEntity<>(sound, header);
    }

    //загружаем в бд одну песню с возвратом ссылки на нее
    @RequestMapping(value = "api/profile/putSingleAudio", method = RequestMethod.POST, produces = {"application/json"})
    public @ResponseBody
    String putSingleAudio(@RequestParam("onefileaudio") MultipartFile multipartFile) throws Exception {
        Playlist playlist = playListService.getDefaultPlaylist();
        String[] name_url = soundService.addSound(multipartFile.getBytes(), playlist);
        playListService.save(playlist);
        String string = "{\"path\":\""+name_url[0]+"\",\"name\":\""+name_url[1]+"\"}";
        return string;
    }

}
