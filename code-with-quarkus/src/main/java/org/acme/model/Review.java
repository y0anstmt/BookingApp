package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "Review")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review extends PanacheEntity {
    @Column(nullable = false,unique = true)
    private int rating;

    @Column(nullable = false, length = 500)
    private String comment;

    @Column(nullable = false)
    private String reviewerName;

    @Column(nullable = false)
    private LocalDate createdAt;

    @ManyToOne
    private User user;

    @ManyToOne
    private Orders order;
}
