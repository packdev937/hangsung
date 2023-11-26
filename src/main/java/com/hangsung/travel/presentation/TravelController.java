package com.hangsung.travel.presentation;

import com.hangsung.city.domain.City;
import com.hangsung.city.service.CityService;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.travel.service.TravelService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TravelController {

    private final TravelService travelService;
    private final CityService cityService;

    @GetMapping("/travel/create")
    public String showCreateTravelPackageForm(Model model) {
        List<City> cities = cityService.findAllCities();
        model.addAttribute("cities", cities);

        return "/travel/addPackage";
    }

    @PostMapping("/travel/create")
    public String createTravelPackage(
        @ModelAttribute CreateTravelPackageRequest createTravelPackageRequest,
        HttpServletRequest request) {
        try {
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

            Long createdPackageId = travelService.createTravelPackage(createTravelPackageRequest,
	Long.parseLong(userId)).getId();
            return "redirect:/travel/" + createdPackageId;
        } catch (IOException e) {
            return "redirect:/";
        }
    }

    @GetMapping("/travel/{travelPackageId}")
    public String showTravelPackageDetailForm(@PathVariable Long travelPackageId, Model model) {
        log.info("showTravelPackageDetails()");
        log.info("packageID" + travelPackageId);
        TravelPackage travelPackage = travelService.getTravelPackage(travelPackageId);
        model.addAttribute("travelPackage", travelPackage);
        return "/travel/detailPackage";
    }

    @PostMapping("/travel/addLike")
    public ResponseEntity<?> addLike(@RequestParam("travelPackageId") Long travelPackageId) {
        TravelPackage travelPackage = travelService.addLike(travelPackageId);
        return ResponseEntity.ok(Collections.singletonMap("likes", travelPackage.getLikes()));
    }

    @PostMapping("/travel/addCart")
    public ResponseEntity<?> addCart(@RequestParam("travelPackageId") Long travelPackageId,
        HttpSession session) {
        try {
            log.info("packageID in addCart" + travelPackageId);
            travelService.addCart(travelPackageId, session);
            return ResponseEntity.ok("장바구니에 추가되었습니다.");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류 발생");
        }
    }


    @GetMapping("/travel/liked-packages")
    public String showTopFiveLikedPackages(Model model) {
        List<TravelPackage> packages = travelService.getTopFiveLikedPackages();
        model.addAttribute("packages", packages);
        return "main/topFiveLikedPakages";
    }

    @GetMapping("/travel/recent-packages")
    public String showFiveRecentPacakages(Model model) {
        List<TravelPackage> packages = travelService.getFiveRecentPackages();
        model.addAttribute("packages", packages);
        return "main/topFiveRecentPackages";
    }
}
