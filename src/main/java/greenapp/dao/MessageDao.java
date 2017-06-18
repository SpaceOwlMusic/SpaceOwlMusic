package greenapp.dao;

import greenapp.model.dialog.Dialog;
import greenapp.model.dialog.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Dmitro on 10.05.2017.
 */
@Transactional(readOnly = true)
public interface MessageDao extends JpaRepository<Message,Long> {
    List<Message> findById(Long dialog);
    List<Message> findByDialog(Dialog dialog);


}
