package org.acme.model;


import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Roles extends PanacheEntity {
    private String roleName;

    @ManyToMany(mappedBy = "roles")
    private List<AuthUser> authUsers;
}
