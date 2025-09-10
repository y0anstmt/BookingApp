package org.acme.repository;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.acme.model.Orders;

import java.util.Optional;

@ApplicationScoped
public class OrdersRepository implements PanacheRepository<Orders> {
    public Optional<Orders> findOrderByEmail(String email){
        Orders order = new Orders();
        order = find("email", order.getUser().getEmail()).firstResult();
        if(order!=null){
            return Optional.of(order);
        }
        return Optional.empty();
    }


}
