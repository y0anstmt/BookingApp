package org.acme.model;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

import java.util.List;


@Getter
@Setter
@Entity
@Table(name = "TypeOfHouse")
@AllArgsConstructor
@NoArgsConstructor
public class TypeOfHouse extends PanacheEntity {
    @Column(nullable = false)
    private String houseType;

    @OneToMany(mappedBy = "typeOfHouse")
    private List<Orders> orders;
}
