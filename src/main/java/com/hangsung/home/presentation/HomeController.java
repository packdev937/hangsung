package com.hangsung.home.presentation;

import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.service.TravelService;
import com.hangsung.user.domain.User;
import com.hangsung.user.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;
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
    private final TravelService travelService;

    /*
    세션에 값이 있다면 로그인 성공으로 간주합니다.
    세션에 값이 없다면 로그인 창으로 리다이렉션 합니다.
     */
    @GetMapping("/")
    public String home(Model model, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String userId = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
	if (cookie.getName().equals("userId")) {
	    userId = cookie.getValue();
	    break;
	}
            }
        }

        if (userId == null) {
            return "redirect:/login";
        }

        List<TravelPackage> recentPackages = travelService.getFiveRecentPackages();
        model.addAttribute("recentPackages", recentPackages);

        List<TravelPackage> likedPackages = travelService.getTopFiveLikedPackages();
        model.addAttribute("likedPackages", likedPackages);

        User user = userService.findUserById(Long.parseLong(userId));
        model.addAttribute("user", user);
        return "/main/home";
    }

    @GetMapping("/cart")
    public String cart(Model model, HttpSession session) {
        List<TravelPackage> cartList = (List<TravelPackage>) session.getAttribute("cart");
        log.info("CartList size : " + cartList.size());
        model.addAttribute("cart", cartList);

        return "/main/cart";
    }

    @GetMapping("/order")
    public String order(Model model, HttpSession session) {
        List<TravelPackage> orderList = (List<TravelPackage>) session.getAttribute("order");
        log.info("orderList size : " + orderList.size());
        model.addAttribute("order", orderList);

        return "/main/order";
    }
}
