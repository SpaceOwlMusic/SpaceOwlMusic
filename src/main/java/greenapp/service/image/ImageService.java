package greenapp.service.image;

import greenapp.model.photo.Image;
import greenapp.model.profile.Profile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Dmitro on 25.05.2017.
 */
public interface ImageService {
    public Image save(Image image);
    public Image getDefaultImage();
    public List<Image> getAllImageForUser(Profile profile);
    public Image getImageById(int i);

}
