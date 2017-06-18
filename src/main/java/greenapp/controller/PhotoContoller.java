package greenapp.controller;

import greenapp.model.photo.Image;
import greenapp.model.user.User;
import greenapp.service.image.ImageService;
import greenapp.service.profile.ProfileService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Dmitro on 28.05.2017.
 */

//
@Controller
public class PhotoContoller {
    @Autowired
    ImageService imageService;
    @Autowired
    ProfileService profileService;

    @Autowired
    UserService userService;

    @RequestMapping(value = {"/profile/photo"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        List<Image> o = imageService.getAllImageForUser(profileService.getCurrentProfile());
        model.addAttribute("photos",o);

        return "myphotos";
    }
}
