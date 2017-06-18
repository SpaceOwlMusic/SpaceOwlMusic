package greenapp.dao;

import greenapp.model.dialog.Dialog;
import greenapp.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Dmitro on 10.05.2017.
 */
public interface DialogDao extends JpaRepository<Dialog,Long>{
    List<Dialog> findByUserFirst_IdOrUserSecond_Id(Long userFirst, Long userSecond);
    Dialog findById(Long id);
    Dialog findByUserFirstAndUserSecondOrUserSecondAndUserFirst(User userFirst,User userSecond,User userSecond1,User userFirst1);
}
