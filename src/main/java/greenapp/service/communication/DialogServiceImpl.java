package greenapp.service.communication;

import greenapp.dao.DialogDao;
import greenapp.dao.MessageDao;
import greenapp.dao.UserDao;
import greenapp.model.dialog.Dialog;
import greenapp.model.dialog.Message;
import greenapp.model.user.User;
import greenapp.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by Dmitro on 11.05.2017.
 */
@Service
public class DialogServiceImpl implements DialogService {
    @Autowired
    DialogDao dialogDao;

    @Autowired
    UserDao userDao;

    @Autowired
    UserService userService;

    @Autowired
    MessageDao messageDao;

    @Override
    public List<Dialog> getMyDialogs() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = userDao.findByUsername(userDetails.getUsername());
        return dialogDao.findByUserFirst_IdOrUserSecond_Id(currentUser.getId(), currentUser.getId());
    }

    @Override
    @Transactional
    public Set<Message> getMessageByIdDialog(Long idDialog) {
        return dialogDao.findById(idDialog).getMessages();
    }

    @Override
    public Dialog save(Dialog dialog) {
        return dialogDao.save(dialog);
    }

    @Transactional
    @Override
    public Message addMessage(Dialog currentIdDialog, User user, String message) {
       Message msg = new Message(user, message,currentIdDialog);
       msg.setDate(Date.valueOf(LocalDate.now()));
        return messageDao.save(msg);
   }

    @Override
    public List<Message> getMessagesById(long id) {
        return messageDao.findByDialog(dialogDao.findOne(id));
    }

    @Override
    public Dialog getDialogByUser(User user) {
        Dialog dialog=dialogDao.findByUserFirstAndUserSecondOrUserSecondAndUserFirst(userService.getCurrentUser(),user,userService.getCurrentUser(),user);
        return dialog;
    }

    @Override
    public Dialog getDialogByID(Long id) {
        return dialogDao.findById(id);
    }
}
