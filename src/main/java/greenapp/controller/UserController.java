package greenapp.controller;

import greenapp.model.photo.Image;
import greenapp.model.user.User;
import greenapp.service.authorization.SecurityService;
import greenapp.service.image.ImageService;
import greenapp.service.profile.ProfileService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller

public class UserController {
    @Autowired
    ProfileService profileService;

    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;

    @Autowired
    ImageService imageService;


    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm) {

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/" + userService.getCurrentUser().getUsername();
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        User user = userService.getCurrentUser();
        //        if (user == null) return "notFound";

        return user == null ? "notFound" : "redirect:/" + user.getUsername();
    }

    @RequestMapping(value = "/{username}", method = RequestMethod.GET, produces = {"application/json"})
    public String userStaticLink(@PathVariable(value = "username") String username, Model model, HttpServletRequest request) {
        if (userService.findByUsername(username)== null) return "notFound";
        if (userService.isAuth()&&userService.getCurrentUser().getUsername().equals(username)) {
            showUser(model, username, request);
            return "profile";
        } else {
            showUser(model, username,request);
            return "userDetailsProfile";
        }
    }

    private Model showUser(Model model, String username, HttpServletRequest request) {
        User user = userService.findByUsername(username);
        boolean is = userService.isAuth();
        Image image = profileService.getUserAvatar(user);
        if (image == null) image = imageService.getDefaultImage();

        request.getSession().setAttribute("username_opened_user",username);
        model.addAttribute("user", user);
        model.addAttribute("avatar", image);
        model.addAttribute("idUser", user.getId());
        return model;
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        model.addAttribute("userForm", new User());
        model.addAttribute("loginStatus",userService.isAuth());
        if(userService.isAuth())
        {
            model.addAttribute("currentUser",userService.getCurrentUser().getUsername());
        }
        return "main";
    }


}
