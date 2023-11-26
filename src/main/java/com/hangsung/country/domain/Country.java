package com.hangsung.country.domain;

import com.hangsung.city.domain.City;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@NoArgsConstructor
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "country_id")
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @OneToMany(mappedBy = "country", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<City> cities = new ArrayList<>();

    public Country(String name) {
        this.name = name;
    }

    public void addCity(City city) {
        cities.add(city);
        city.setCountry(this);
    }
}
