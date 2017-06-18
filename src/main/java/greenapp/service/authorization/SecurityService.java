package greenapp.service.authorization;

/**
 * Created by Dmitro on 09.05.2017.
 */
public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
