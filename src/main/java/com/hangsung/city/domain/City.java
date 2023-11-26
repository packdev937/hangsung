package com.hangsung.city.domain;

import com.hangsung.country.domain.Country;
import com.hangsung.travel.domain.TravelPackage;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id")
    private Long id;

    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id")
    private Country country;

    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TravelPackage> travelPackages = new ArrayList<>();

    public City(String name, Country country) {
        this.name = name;
        this.country = country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public void addTravelPackage(TravelPackage travelPackage) {
        this.travelPackages.add(travelPackage);
    }
}
