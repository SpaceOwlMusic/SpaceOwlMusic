package greenapp.model.sound;

import javax.persistence.*;

/**
 * Created by Dmitro on 23.05.2017.
 */
@Entity
@Table(name = "genre")
public class Genre {
    public Genre() {
    }

    public Genre(String name) {
        this.name = name;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;

    @Column(name = "name")
    String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
