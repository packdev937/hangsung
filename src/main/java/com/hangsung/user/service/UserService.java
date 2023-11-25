package com.hangsung.user.service;

import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import com.hangsung.user.request.SigninRequest;
import com.hangsung.user.request.SignupRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public void signup(SignupRequest signupRequest) {
        if (userRepository.findByUsername(signupRequest.username()).isPresent()) {
            throw new IllegalArgumentException("이미 존재 하는 아이디 입니다.");
        }

        User user = User.builder()
            .username(signupRequest.username())
            .password(signupRequest.password())
            .nickname(signupRequest.nickname())
            .birthAt(signupRequest.birthAt())
            .gender(signupRequest.gender())
            .build();

        userRepository.save(user);
    }

    public User login(SigninRequest signinRequest) {
        User user = userRepository.findByUsername(signinRequest.username())
            .orElseThrow(() -> new IllegalArgumentException("존재 하지 않는 아이디 입니다."));

        if (!signinRequest.password().equals(user.getPassword())) {
            throw new IllegalArgumentException("아이디 또는 비밀번호가 맞지 않습니다. 다시 입력해주세요.");
        }

        return user;
    }
}
