package greenapp.model.dialog;

import greenapp.model.user.User;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Dmitro on 10.05.2017.
 */
@Entity
@Table(name = "dialog")
public class Dialog {



    public Dialog() {
    }

    public Dialog(User userFirst, User userSecond) {
        this.userFirst = userFirst;
        this.userSecond = userSecond;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(optional = false)
    @JoinColumn(name = "user_first", unique = true, nullable = false)
    private User userFirst;

    @OneToOne(optional = false)
    @JoinColumn(name = "user_second", unique = true, nullable = false)
    private User userSecond;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "dialog")
    private Set<Message> messages;

    public Set<Message> getMessages() {
        return messages;
    }

    public void setMessages(Set<Message> messages) {
        this.messages = messages;
    }
    //    @OneToMany(fetch = FetchType.EAGER)
//    @JoinTable(name = "user_dialogs", joinColumns = @JoinColumn(name = "dialog_id"),
//            inverseJoinColumns = @JoinColumn(name = "message_id"))
//    private Set<Message> messages;
//
//    public Set<Message> getMessages() {
//        return messages;
//    }
//
//    public void setMessages(Set<Message> messages) {
//        this.messages = messages;
//    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUserFirst() {
        return userFirst;
    }

    public void setUserFirst(User userFirst) {
        this.userFirst = userFirst;
    }

    public User getUserSecond() {
        return userSecond;
    }

    public void setUserSecond(User userSecond) {
        this.userSecond = userSecond;
    }

}
