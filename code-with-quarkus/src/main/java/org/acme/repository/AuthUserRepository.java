package org.acme.repository;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.acme.model.AuthUser;

@ApplicationScoped
public class AuthUserRepository implements PanacheRepository<AuthUser> {

    public AuthUser findByEmail(String email) {
        return find("email", email).firstResultOptional()
                .orElseThrow(() -> new IllegalArgumentException("User with email " + email + " not found"));
    }
}
