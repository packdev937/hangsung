package com.hangsung.user.domain;

import static jakarta.persistence.EnumType.STRING;
import static lombok.AccessLevel.PROTECTED;

import com.hangsung.travel.domain.TravelPackage;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Getter
@NoArgsConstructor(access = PROTECTED)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false, unique = true)
    private String nickname;

    @DateTimeFormat
    private LocalDate birthAt;

    @Enumerated(value = STRING)
    private Gender gender;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;

//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<TravelPackage> createdPackage;

    @Builder
    public User(final String username, final String password, final String nickname,
        final LocalDate birthAt, final Gender gender) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.birthAt = birthAt;
        this.gender = gender;
        this.createdAt = LocalDateTime.now();
    }
}
