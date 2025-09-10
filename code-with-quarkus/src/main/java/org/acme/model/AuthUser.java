package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "AuthUser")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthUser extends PanacheEntity {
    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "authuser_roles",
        joinColumns = @JoinColumn(name = "authuser_id"),
        inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private List<Roles> roles;
}
