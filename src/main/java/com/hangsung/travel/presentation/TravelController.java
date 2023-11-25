package com.hangsung.travel.presentation;

import com.hangsung.city.domain.City;
import com.hangsung.city.service.CityService;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.travel.service.TravelService;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
        HttpSession session) {
        try {
            Long createdPackageId = travelService.createTravelPackage(createTravelPackageRequest,
                session).getId();
            return "redirect:/travel/" + createdPackageId;
        } catch (IOException e) {
            return "redirect:/";
        }
    }

    @GetMapping("/travel/{travelPackageId}")
    public String showTravelPackageDetailForm(@PathVariable Long travelPackageId, Model model) {
        TravelPackage travelPackage = travelService.getTravelPackage(travelPackageId);
        model.addAttribute("travelPackage", travelPackage);
        return "/travel/detailPackage";
    }

    @PostMapping("/travel/addLike")
    public ResponseEntity<?> addLike(@RequestParam("travelPackageId") Long travelPackageId) {
        TravelPackage travelPackage = travelService.addLike(travelPackageId);
        return ResponseEntity.ok(Collections.singletonMap("likes", travelPackage.getLikes()));
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
