package greenapp.service.communication;

import greenapp.model.dialog.Dialog;
import greenapp.model.dialog.Message;
import greenapp.model.user.User;

import java.util.List;
import java.util.Set;

/**
 * Created by Dmitro on 10.05.2017.
 */
public interface DialogService {
    public List<Dialog> getMyDialogs();

    public Set<Message> getMessageByIdDialog(Long idDialog);

    public Dialog save(Dialog dialog);

    Message addMessage(Dialog currentDialog, User sender, String message);

    List<Message> getMessagesById(long id);

    Dialog getDialogByUser(User user);

    Dialog getDialogByID(Long id);

}
