package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Entity
@Table(name = "Adress")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Adress extends PanacheEntity {
    @Column(nullable = false)
    private String street;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String postalCode;

    @OneToOne(mappedBy = "adress")
    private TypeOfHouse house;
}
