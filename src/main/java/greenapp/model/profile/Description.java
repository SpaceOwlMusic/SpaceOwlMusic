package greenapp.model.profile;

import javax.persistence.*;

/**
 * Created by Dmitro on 30.05.2017.
 */
@Entity
@Table(name = "description_about_users")
public class Description {
    public Description() {
    }

    public Description(String favoriteMusic, String hobbies, String aboutYourself, String inspiration, String musicCompose, String otherInformation) {
        this.favoriteMusic = favoriteMusic;
        this.hobbies = hobbies;
        this.aboutYourself = aboutYourself;
        this.inspiration = inspiration;
        this.musicCompose = musicCompose;
        this.otherInformation = otherInformation;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "favorite_music")
    private String favoriteMusic;

    @Column(name = "hobbies")
    private String hobbies;

    @Column(name = "about_yourself")
    private String aboutYourself;

    @Column(name = "inspiration")
    private String inspiration;

    @Column(name = "music_compose")
    private String musicCompose;

    @Column(name = "other_information")
    private String otherInformation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFavoriteMusic() {
        return favoriteMusic;
    }

    public void setFavoriteMusic(String favoriteMusic) {
        this.favoriteMusic = favoriteMusic;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getAboutYourself() {
        return aboutYourself;
    }

    public void setAboutYourself(String aboutYourself) {
        this.aboutYourself = aboutYourself;
    }

    public String getInspiration() {
        return inspiration;
    }

    public void setInspiration(String inspiration) {
        this.inspiration = inspiration;
    }

    public String getMusicCompose() {
        return musicCompose;
    }

    public void setMusicCompose(String musicCompose) {
        this.musicCompose = musicCompose;
    }

    public String getOtherInformation() {
        return otherInformation;
    }

    public void setOtherInformation(String otherInformation) {
        this.otherInformation = otherInformation;
    }
}
