package greenapp.controller;

import greenapp.model.photo.Image;
import greenapp.model.profile.Description;
import greenapp.model.profile.Profile;
import greenapp.model.user.User;
import greenapp.service.profile.DescriptionService;
import greenapp.service.profile.ProfileService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

/**
 * Created by Dmitro on 28.05.2017.
 */
@Controller
public class SettingsController {
    @Autowired
    UserService userService;

    @Autowired
    DescriptionService descriptionService;

    @Autowired
    ProfileService profileService;


    @RequestMapping(value = "/profile/settings", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", userService.getCurrentUser());

        return "settings";
    }

    @RequestMapping(value = "/api/settings/update_first_block", method = RequestMethod.POST)
    public String updateFirstBlock(Model model, @RequestParam HashMap<String, String> data) {
        model.addAttribute("user", userService.getCurrentUser());
        User user = userService.getCurrentUser();
        user.setEmail(data.get("name"));
        user.setFirstName(data.get("first_name"));
        user.setLastName(data.get("last_name"));
        user.setGender(data.get("gender"));
        user.setRelationship(data.get("relation"));
        userService.update(user);

        return "settings";
    }

    @RequestMapping(value = "api/settings/update_second_block", method = RequestMethod.POST)
    public String updateSecondBlock(Model model, @RequestParam HashMap<String, String> data) {
        model.addAttribute("user", userService.getCurrentUser());
        Description description = profileService.getCurrentProfile().getDescription();
        description.setHobbies(data.get("hobbies"));
        description.setFavoriteMusic(data.get("favorite_music"));
        description.setAboutYourself(data.get("about_yourself"));
        descriptionService.save(description);

        return "settings";
    }

    @RequestMapping(value = "/api/settings/update_third_block", method = RequestMethod.POST)
    public String updateThirdBlock(Model model, @RequestParam HashMap<String, String> data) {
        model.addAttribute("user", userService.getCurrentUser());
        Description description = profileService.getCurrentProfile().getDescription();
        description.setInspiration(data.get("inspiration"));
        description.setMusicCompose(data.get("you_compose"));
        description.setOtherInformation(data.get("other"));
        descriptionService.save(description);

        return "settings";
    }

}
