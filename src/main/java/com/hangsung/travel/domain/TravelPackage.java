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

    @OneToOne
    private City destination;

    @Column(nullable = false)
    private String filename;

    @Column(nullable = false)
    private String duration;

    @Column(nullable = false)
    private int people;

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
    public TravelPackage(String title, City destination, String filename, String duration,
        int people, String travelRoute, User user) {
        this.title = title;
        this.destination = destination;
        this.filename = filename;
        this.duration = duration;
        this.people = people;
        this.travelRoute = travelRoute;
        this.user = user;

        // Initialization
        this.likes = 0;
        this.createdAt = LocalDateTime.now();
    }
}
