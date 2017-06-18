package greenapp.service.image;

import greenapp.dao.ImageDao;
import greenapp.model.photo.Image;
import greenapp.model.profile.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Dmitro on 25.05.2017.
 */
@Service
public class ImageServiceImpl implements ImageService{
    @Autowired
    ImageDao imageDao;
    @Override
    public Image save(Image image) {
        return imageDao.save(image);

    }

    @Override
    public Image getDefaultImage() {
        Image image= imageDao.findByType("default_image");
        return image;
    }

    @Transactional
    @Override
    public List<Image> getAllImageForUser(Profile profile) {
        return imageDao.findByProfile(profile);
    }

    @Override
    public Image getImageById(int id) {
        Image image=imageDao.findById(id);

        return image;
    }


}
