package greenapp.controller;

import greenapp.model.photo.Image;
import greenapp.model.photo.MapperImage;
import greenapp.model.user.User;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Dmitro on 30.05.2017.
 */
@Controller
public class PeopleController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/people", method = RequestMethod.GET)
    public String people(Model model) {


        // model.addAttribute("userForm", new User());

        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);


        return "people";
    }





}
