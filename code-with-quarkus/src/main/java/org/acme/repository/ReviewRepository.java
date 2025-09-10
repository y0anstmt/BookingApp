package org.acme.repository;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.acme.model.Review;
import org.acme.model.User;

import java.util.Optional;

@ApplicationScoped
public class ReviewRepository implements PanacheRepository<Review> {
    public Optional<User> findReviewByEmail(String email){
        Review review = find("email", email).firstResult();
        if(review!=null){
            return Optional.of(review.getUser());
        }
        return Optional.empty();
    }
}
