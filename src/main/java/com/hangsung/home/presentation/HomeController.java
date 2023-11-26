package com.hangsung.home.presentation;

import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import com.hangsung.user.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
@Slf4j
public class HomeController {

    private final UserService userService;

    /*
    세션에 값이 있다면 로그인 성공으로 간주합니다.
    세션에 값이 없다면 로그인 창으로 리다이렉션 합니다.
     */
    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        User user = userService.findUserById(userId);
        model.addAttribute("user", user);
        return "/main/home";
    }
}
