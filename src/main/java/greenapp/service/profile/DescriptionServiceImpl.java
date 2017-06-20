package greenapp.service.profile;

import greenapp.dao.DescriptionDao;
import greenapp.model.profile.Description;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Dmitro on 20.06.2017.
 */
@Service
public class DescriptionServiceImpl implements DescriptionService {
    @Autowired
    private DescriptionDao descriptionDao;

    @Override
    public Description save(Description description) {
        return descriptionDao.save(description);
    }
}
