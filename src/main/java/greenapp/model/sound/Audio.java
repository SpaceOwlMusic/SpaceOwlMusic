package greenapp.model.sound;

import javax.persistence.*;

/**
 * Created by Dmitro on 01.06.2017.
 */@Entity
@Table(name = "audio")
public class Audio {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "url")
    private String url;

    @Column(name = "author")
    private String author;

    @Column(name = "album")
    private String album;

    @Column(name = "year")
    private String year;

    @Column(name = "comment")
    private String comment;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mapp_audio_id", nullable = false)
    private MapperSounds mapperSounds;

    public MapperSounds getMapperSounds() {
        return mapperSounds;
    }

    public void setMapperSounds(MapperSounds mapperSounds) {
        this.mapperSounds = mapperSounds;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}


