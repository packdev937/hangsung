package com.hangsung.travel.presentation;

import com.hangsung.city.domain.City;
import com.hangsung.city.service.CityService;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.travel.service.TravelService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TravelController {

    private final TravelService travelService;
    private final CityService cityService;

    @GetMapping("/create")
    public String showCreateTravelPackageForm(Model model) {
        log.info("run showCreateTravelPackageForm()");

        List<City> cities = cityService.findAllCities();

        model.addAttribute("cities", cities);

        return "/travel/addPackage";
    }

    @PostMapping("/create")
    public String createTravelPackage(
        @ModelAttribute CreateTravelPackageRequest createTravelPackageRequest) {
        log.info("run createTravelPackage()");
        travelService.createTravelPackage(createTravelPackageRequest);
        return "redirect:/";
    }
}
