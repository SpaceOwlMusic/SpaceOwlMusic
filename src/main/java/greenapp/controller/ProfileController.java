package greenapp.controller;

import greenapp.dao.SoundDao;
import greenapp.model.dialog.Dialog;
import greenapp.model.dialog.Message;
import greenapp.model.photo.Image;
import greenapp.model.sound.Playlist;
import greenapp.model.user.User;
import greenapp.service.communication.DialogService;
import greenapp.service.image.ImageService;
import greenapp.service.profile.ProfileService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * Created by Dmitro on 11.05.2017.
 */

@Controller
@SessionAttributes("session_data")
public class ProfileController {


    @Autowired
    UserService userService;



    @Autowired
    DialogService dialogService;

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String registration(Model model) {//,HttpServletRequest request) {

//
        return "profile";
    }



    //отримавши id діалога шукаємо поле із своїм id
    @RequestMapping(value = "/dialog", method = RequestMethod.GET)
    public String openDialog(Model model, @RequestParam(value = "id") String id,HttpServletRequest request) {
        Dialog dialog = dialogService.getDialogByUser(userService.findByID(Integer.parseInt(id)));
        if(dialog==null){
            String user=(String) request.getSession().getAttribute("username_opened_user");
            User sUser=userService.findByUsername(user);
            dialog=new Dialog(userService.getCurrentUser(),sUser);
            dialogService.save(dialog);
        }
        return "chat";
    }

    @RequestMapping(value = "/fromDialogs", method = RequestMethod.GET)
    public String openDialogFromDialogs(Model model, @RequestParam(value = "username") String username,HttpServletRequest request) {
        request.getSession().setAttribute("username_opened_user",username);
        return "chat";
    }

//    //отримавши id діалога шукаємо поле із своїм id
//    @RequestMapping(value = "/dialog/history/{id}", method = RequestMethod.GET)
//    public String openHistory(Model model, @PathVariable(value = "id") String id, HttpServletRequest request) {
//
//        String opened_user = (String) request.getSession().getAttribute( "username_opened_user");
//
//        List<Message> messages = dialogService.getMessagesById(Long.parseLong(id));
//        model.addAttribute("messages", messages);
//
//
//        return "chat";
//    }


    //create playlist
    @RequestMapping(value = "/api/putMessage", method = RequestMethod.POST)
    @ResponseBody
    String putMessage(HttpServletRequest httpServletRequest, @RequestParam(value = "comment") String comment, HttpServletRequest request) {
        String opened_user = (String) request.getSession().getAttribute("username_opened_user");
        Message message = dialogService.addMessage(dialogService.getDialogByUser(userService.findByUsername(opened_user)), userService.getCurrentUser(), comment);
        String json = message.toString();
        return "good";
    }


    @RequestMapping(value = "/api/getMessage", method = RequestMethod.GET)
    @ResponseBody
    public String getMessage(HttpServletRequest request) {
        Dialog dialog = dialogService.getDialogByUser(userService.findByUsername((String) request.getSession().getAttribute("username_opened_user")));
        List<Message> messages = dialogService.getMessagesById(dialog.getId());
        StringBuilder json = new StringBuilder("{\"history\":");

            json.append(messages.toString());

        json.append("}");

        return String.valueOf(json);
    }


}