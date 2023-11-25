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
import jakarta.persistence.OneToOne;
import java.time.LocalDateTime;
import lombok.Builder;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

@Entity
@NoArgsConstructor
public class TravelPackage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "travel_id")
    private Long id;

    private String title;
    @OneToOne
    private City destination;
    private String photoUrl;
    private String duration;
    private int recommendedNumberOfPeople;

    private String travelRoute;

    private int likes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Builder
    public TravelPackage(String title, City destination, String photoUrl, String duration,
        int recommendedNumberOfPeople, String travelRoute, int likes, User user) {
        this.title = title;
        this.destination = destination;
        this.photoUrl = photoUrl;
        this.duration = duration;
        this.recommendedNumberOfPeople = recommendedNumberOfPeople;
        this.travelRoute = travelRoute;
        this.likes = likes;
    }
}
