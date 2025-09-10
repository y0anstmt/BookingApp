package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "AuthUserRole")
@Getter
@Setter
public class AuthUserRole extends PanacheEntity {

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    public AuthUser user;

    @ManyToOne
    @JoinColumn(name = "roleId", nullable = false)
    public Roles role;
}
