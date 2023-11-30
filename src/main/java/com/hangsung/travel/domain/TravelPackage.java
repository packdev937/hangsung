package com.hangsung.travel.domain;

import com.hangsung.city.domain.City;
import com.hangsung.user.domain.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

@Entity
@Getter
@NoArgsConstructor
public class TravelPackage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "travel_id")
    private Long id;

    @Column(nullable = false)
    private String title;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id")
    private City city;

    @Column(nullable = false)
    private String filename;

    @Column(nullable = false)
    private String duration;

    @Column(nullable = false)
    private int people;

    @Column(nullable = false)
    private int price;

    @Column(nullable = false)
    private int likes;

    @Column(nullable = false)
    private String travelRoute;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Builder
    public TravelPackage(String title, City city, String filename, String duration,
        int people, String travelRoute, int likes, int price, User user) {
        this.title = title;
        this.city = city;
        this.filename = filename;
        this.duration = duration;
        this.people = people;
        this.travelRoute = travelRoute;
        this.price = price;
        this.user = user;

        // Initialization
        this.likes = likes;
        this.createdAt = LocalDateTime.now();
    }

    public void addLike() {
        this.likes++;
    }

    public void addCity(City city) {
        this.city = city;
    }
}
