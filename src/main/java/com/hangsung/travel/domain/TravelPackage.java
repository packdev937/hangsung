package com.hangsung.travel.domain;

import com.hangsung.city.domain.City;
import jakarta.annotation.Nullable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
    private String photoUrl;

    @Column(nullable = false)
    private String duration;

    @Column(nullable = false)
    private int people;

    @Column(nullable = false)
    private String travelRoute;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "user_id")
//    private User user;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

    @Builder
    public TravelPackage(String title, City destination, String photoUrl, String duration,
        int people, String travelRoute) {
        this.title = title;
        this.destination = destination;
        this.photoUrl = photoUrl;
        this.duration = duration;
        this.people = people;
        this.travelRoute = travelRoute;
    }
}
