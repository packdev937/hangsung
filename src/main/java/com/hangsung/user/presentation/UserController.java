package com.hangsung.user.presentation;

import com.hangsung.user.request.SigninRequest;
import com.hangsung.user.request.SignupRequest;
import com.hangsung.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;

    @GetMapping("/signup")
    public String showSignupForm() {
        log.info("run showSignupForm()");
        return "user/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute SignupRequest signupRequest,
        RedirectAttributes redirectAttributes) {
        log.info("run signup()");
        try {
            userService.signup(signupRequest);
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("loginError", e.getMessage());
            return "redirect:/signup";
        }
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        log.info("run showLoginForm()");
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute SigninRequest signinRequest,
        RedirectAttributes redirectAttributes) {
        try {
            userService.login(signinRequest);
            return "redirect:/login";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("loginError", e.getMessage());
            return "redirect:/signup";
        }
    }
}
