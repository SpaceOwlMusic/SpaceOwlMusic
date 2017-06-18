package greenapp.model.photo;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by ЖЛЗК on 21.05.2017.
 */
@Entity
@Table(name = "mapper_image")
public class MapperImage {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "base64")
    private String base64;

    @Column(name = "contenttype")
    private String contenttype;

    @Column(name = "fileoriginalsize")
    private int fileoriginalsize;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "mapperImage")
    private Set<Image> imageSet;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }

    public String getContenttype() {
        return contenttype;
    }

    public void setContenttype(String contenttype) {
        this.contenttype = contenttype;
    }

    public int getFileoriginalsize() {
        return fileoriginalsize;
    }

    public void setFileoriginalsize(int fileoriginalsize) {
        this.fileoriginalsize = fileoriginalsize;
    }

    public Set<Image> getImageSet() {
        return imageSet;
    }

    public void setImageSet(Set<Image> imageSet) {
        this.imageSet = imageSet;
    }
}
