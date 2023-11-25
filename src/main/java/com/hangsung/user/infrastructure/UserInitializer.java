package com.hangsung.user.infrastructure;

import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.user.domain.Gender;
import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import jakarta.annotation.PostConstruct;
import java.time.LocalDate;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserInitializer {

    private final UserRepository userRepository;

    @PostConstruct
    public void setup() {
        User admin = User.builder()
            .username("admin")
            .password("1234")
            .nickname("admin")
            .birthAt(LocalDate.of(1999, 3, 27))
            .gender(Gender.MALE)
            .build();

        userRepository.save(admin);
    }
}
