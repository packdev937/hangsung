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
        log.info("run showCreateTravelPackageForm()");

        List<City> cities = cityService.findAllCities();
        model.addAttribute("cities", cities);

        return "/travel/addPackage";
    }

    @PostMapping("/travel/create")
    public String createTravelPackage(
        @ModelAttribute CreateTravelPackageRequest createTravelPackageRequest,
        HttpSession session) {
        log.info("run createTravelPackage()");
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
        log.info("Likes 수 " + travelPackage.getLikes());
        return ResponseEntity.ok(Collections.singletonMap("likes", travelPackage.getLikes()));
    }

//    @GetMapping("/top-liked")
//    public String getTopLikedPackages() {
//        List<TravelPackage> topPackages = travelService.getTopLikedPackages();
//        ModelAndView mav = new ModelAndView("travel/top-liked");
//        mav.addObject("topPackages", topPackages);
//        return mav;
//    }
//
//    @GetMapping("/recent")
//    public ModelAndView getRecentPackages() {
//        List<TravelPackage> recentPackages = travelService.getRecentPackages();
//        ModelAndView mav = new ModelAndView("travel/recent");
//        mav.addObject("recentPackages", recentPackages);
//        return mav;

}
