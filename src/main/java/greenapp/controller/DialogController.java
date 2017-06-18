package greenapp.controller;

import greenapp.model.dialog.Dialog;
import greenapp.model.user.User;
import greenapp.service.communication.DialogService;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ЖЛЗК on 18.06.2017.
 */
@Controller
public class DialogController {

    @Autowired
    DialogService dialogService;


    @RequestMapping(value = "/dialogs", method = RequestMethod.GET)
    public String dialogs(Model model) {

        List<Dialog> dialog = dialogService.getMyDialogs();
        model.addAttribute("dialog", dialog);


        return "dialogs";
    }

/*
    //отримавши id діалога шукаємо поле із своїм id
    @RequestMapping(value = "/dialog", method = RequestMethod.GET)
    public String openDialog(Model model, @RequestParam(value = "id") String id, HttpServletRequest request) {
        Dialog dialog = dialogService.getDialogByID((long) Integer.parseInt(id));
        model.addAttribute("dialog",dialog);
        return "chat";
    }
*/

}
