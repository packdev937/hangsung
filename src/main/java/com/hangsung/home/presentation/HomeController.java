package com.hangsung.home.presentation;

import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.service.TravelService;
import com.hangsung.user.domain.User;
import com.hangsung.user.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
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

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request, HttpSession session)
        throws SQLException {
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
        initialize(session);

        List<TravelPackage> recentPackages = travelService.getFourRecentPackages();
        model.addAttribute("recentPackages", recentPackages);

        List<TravelPackage> likedPackages = travelService.getTopFourLikedPackages();
        model.addAttribute("likedPackages", likedPackages);

        User user = userService.findUserById(Long.parseLong(userId));
        model.addAttribute("user", user);
        return "/main/home";
    }

    private void initialize(HttpSession session) {
        if (session.getAttribute("cart") == null) {
            List<TravelPackage> cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        if (session.getAttribute("order") == null) {
            List<TravelPackage> order = new ArrayList<>();
            session.setAttribute("order", order);
        }
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
