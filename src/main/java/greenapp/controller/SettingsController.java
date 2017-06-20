package greenapp.controller;

import greenapp.model.photo.Image;
import greenapp.model.user.User;
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

    @RequestMapping(value = "/profile/settings", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", userService.getCurrentUser());

        return "settings";
    }

    @RequestMapping(value = "/api/settings/update_first_block", method = RequestMethod.POST)
    public String updateFirstBlock(Model model, @RequestParam HashMap<String,String> data) {
        model.addAttribute("user", userService.getCurrentUser());
        User user=userService.getCurrentUser();
        int ee=4;


        return "settings";
    }
}
