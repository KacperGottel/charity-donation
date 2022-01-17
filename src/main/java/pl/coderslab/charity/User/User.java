package pl.coderslab.charity.User;

import lombok.Data;
import pl.coderslab.charity.Donation.Donation;
import pl.coderslab.charity.User.role.Role;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    @Email
    private String email;
    @NotNull
    @Column(columnDefinition = "char(64)")
    private String username;
    @NotNull
    private String password;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    private Role role;
    private boolean enabled;
    @OneToMany(fetch = FetchType.EAGER,mappedBy="user")
    private List<Donation> donations;
}
