package com.hangsung.user.presentation;

import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.user.domain.User;
import com.hangsung.user.request.SigninRequest;
import com.hangsung.user.request.SignupRequest;
import com.hangsung.user.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        return "user/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute SignupRequest signupRequest,
        RedirectAttributes redirectAttributes) {
        try {
            userService.signup(signupRequest);
            return "redirect:/login";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("signupError", e.getMessage());
            return "redirect:/signup";
        }
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute SigninRequest signinRequest,
        RedirectAttributes redirectAttributes,
        HttpServletResponse response,
        HttpSession session) {
        try {
            User user = userService.login(signinRequest);
            createCookie(response, "userId", user.getId().toString(), 24 * 60 * 60);
            initializeCart(session);
            return "redirect:/";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("loginError", e.getMessage());
            return "redirect:/login";
        }
    }

    private void createCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setHttpOnly(true);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    private void initializeCart(HttpSession session) {
        List<TravelPackage> cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        invalidateSession(request);
        clearCookies(request, response);
        return "redirect:/login";
    }

    private void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    private void clearCookies(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
	deleteCookie(response, cookie);
            }
        }
    }

    private void deleteCookie(HttpServletResponse response, Cookie cookie) {
        cookie.setValue("");
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    @GetMapping("/mypage")
    public String showMyPageForm(HttpServletRequest request, Model model) {
        Long userId = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
	if ("userId".equals(cookie.getName())) {
	    try {
	        userId = Long.parseLong(cookie.getValue());
	    } catch (NumberFormatException e) {
	        log.error("UserId cookie parsing error", e);
	        return null;
	    }
	}
            }
        }

        User user = userService.findUserById(userId);
        model.addAttribute("user", user);

        return "user/mypage";
    }

    @PostMapping("/user/change-password")
    public String changePassword(Long userId, String newPassword,
        RedirectAttributes redirectAttributes) {
        try {
            userService.changePassword(userId, newPassword);
            redirectAttributes.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "비밀번호 변경 중 오류가 발생했습니다.");
        }
        return "redirect:/mypage";
    }

    @PostMapping("/user/change-nickname")
    public String changeNickname(Long userId, String newNickname,
        RedirectAttributes redirectAttributes) {
        try {
            userService.changeNickname(userId, newNickname);
            redirectAttributes.addFlashAttribute("message", "닉네임이 변경되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "닉네임 변경 중 오류가 발생했습니다.");
        }
        return "redirect:/mypage";
    }

    @GetMapping("/delete-account")
    public String deleteAccount(Long userId, RedirectAttributes redirectAttributes) {
        try {
            userService.deleteAccount(userId);
            redirectAttributes.addFlashAttribute("message", "계정이 삭제되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "계정 삭제 중 오류가 발생했습니다.");
        }
        return "redirect:/login";
    }
}
