package greenapp.model.dialog;

import greenapp.model.user.User;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

/**
 * Created by Dmitro on 10.05.2017.
 */
@Entity
@Table(name = "message")
public class Message implements Serializable{
    public Message() {
    }

    public Message(User sender, String message, Dialog dialog) {
        this.sender = sender;
        this.message = message;
        this.dialog = dialog;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(optional = false)
    @JoinColumn(name="id_sender", unique = true, nullable = false)
    private User sender;

    @Column(name = "msg")
    private String message;

    @Column(name = "date")
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    @NotFound(action = NotFoundAction.IGNORE)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_dialog", nullable = true)
    private Dialog dialog;


    public Dialog getDialog() {
        return dialog;
    }

    public void setDialog(Dialog dialog) {
        this.dialog = dialog;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return
                "{ \"id\":" + "\""+id +"\""+
                        ",\"sender\":" + "\""+ sender.getUsername()+"\"" +
                        ",\"message\":"+ "\"" + message + "\"" +
                        ",\"dialog\":" + "\""+ dialog.getId()+"\"" +
                        "}";
    }
}
