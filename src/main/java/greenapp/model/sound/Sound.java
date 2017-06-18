package greenapp.model.sound;

import greenapp.model.photo.MapperImage;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Dmitro on 23.05.2017.
 */
@Entity
@Table(name = "sound")
public class Sound {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name="style")
    private int style;

    @Column(name="start_time")
    private int startTime;

    @Column(name="stop_time")
    private int stopTime;

    @Column(name="rating")
    private int rating;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mapp_sound_id", nullable = false)
    private MapperSounds mapperSounds;


    @OneToOne(optional = false)
    @JoinColumn(name="genre", unique = true, nullable = false)
    private Genre genre;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "sounds")
    private Set<Playlists> playlists ;

    public Set<Playlists> getPlaylists() {
        return playlists;
    }

    public void setPlaylists(Set<Playlists> playlists) {
        this.playlists = playlists;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStyle() {
        return style;
    }

    public void setStyle(int style) {
        this.style = style;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getStopTime() {
        return stopTime;
    }

    public void setStopTime(int stopTime) {
        this.stopTime = stopTime;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public MapperSounds getMapperSounds() {
        return mapperSounds;
    }

    public void setMapperSounds(MapperSounds mapperSounds) {
        this.mapperSounds = mapperSounds;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

//    public Set<Playlists> getPlaylists() {
//        return playlists;
//    }
//
//    public void setPlaylists(Set<Playlists> playlists) {
//        this.playlists = playlists;
//    }
}
