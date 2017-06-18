package greenapp.model.sound;

import greenapp.model.photo.Image;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Dmitro on 23.05.2017.
 */
@Entity
@Table(name = "mapper_sound")
public class MapperSounds {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "path")
    private String path;

    @Column(name = "name")
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "mapperSounds")
    private Set<Audio> sounds;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Set<Audio> getSounds() {
        return sounds;
    }

    public void setSounds(Set<Audio> sounds) {
        this.sounds = sounds;
    }
}
