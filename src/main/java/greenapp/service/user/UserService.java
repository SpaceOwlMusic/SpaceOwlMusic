package greenapp.service.user;

import greenapp.model.user.User;

import java.util.List;

/**
 * Created by Dmitro on 09.05.2017.
 */
public interface UserService {
    void save(User user);

    User findByUsername(String username);

    User findByID(int id);

    List<User> getAllUsers();

    User getCurrentUser();

    boolean isAuth();

    void addFriend(Long friendId);

}
