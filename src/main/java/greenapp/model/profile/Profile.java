package greenapp.model.profile;

import greenapp.model.dialog.Message;
import greenapp.model.photo.Image;
import greenapp.model.user.User;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Dmitro on 23.05.2017.
 */
@Entity
@Table(name = "profile")
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(optional = false)
    @JoinColumn(name = "user_id", unique = true, nullable = false)
    private User user;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profile")
    private Set<Image> images;


    @OneToOne(optional = false)
    @JoinColumn(name = "avatar_id", unique = true, nullable = false)
    private Image avatar;

    @Column(name = "location_id")
    private Long location_id;


    @OneToOne(optional = false)
    @JoinColumn(name = "description_id", unique = true, nullable = false)
    private Description description;

    @Column(name = "gender")
    private String gender;

    public Description getDescription() {
        return description;
    }

    public void setDescription(Description description) {
        this.description = description;
    }

    public Set<Image> getImages() {
        return images;
    }

    public void setImages(Set<Image> images) {
        this.images = images;
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Image getAvatar() {
        return avatar;
    }

    public void setAvatar(Image avatar) {
        this.avatar = avatar;
    }

    public Long getLocation_id() {
        return location_id;
    }

    public void setLocation_id(Long location_id) {
        this.location_id = location_id;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
