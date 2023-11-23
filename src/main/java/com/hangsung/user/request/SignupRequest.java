package com.hangsung.user.request;

import com.hangsung.user.domain.Gender;
import java.time.LocalDate;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

public record SignupRequest(String username, String password, String nickname,
	            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate birthAt,
	            Gender gender) {

}
