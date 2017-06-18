package greenapp.service.profile;

import greenapp.model.photo.Image;
import greenapp.model.profile.Description;
import greenapp.model.profile.Profile;
import greenapp.model.user.User;
import sun.security.krb5.internal.crypto.Des;

/**
 * Created by Dmitro on 25.05.2017.
 */
public interface ProfileService {
    void createProfileForUser(User user);
    Image getUserAvatar(User user);
    void setAvatar(Image image);
    Profile getCurrentProfile();
    Description saveDescription(Description description);
}
