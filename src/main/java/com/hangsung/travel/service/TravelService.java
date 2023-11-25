package com.hangsung.travel.service;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class TravelService {

    private final TravelRepository travelRepository;

//    public List<TravelPackage> getTopLikedPackages() {
//        return travelRepository.findTop5ByOrderByLikesDesc();
//    }
//
//    public List<TravelPackage> getRecentPackages() {
//        return travelRepository.findTop5ByOrderByCreatedAtDesc();
//    }

    @Transactional
    public TravelPackage createTravelPackage(
        CreateTravelPackageRequest createTravelPackageRequest) {
        log.info("createTravelPacakgeRequest{ }", createTravelPackageRequest.people());
        TravelPackage travelPackage = TravelPackage.builder()
            .title(createTravelPackageRequest.title())
            .destination(createTravelPackageRequest.destination())
            .photoUrl(createTravelPackageRequest.photoUrl())
            .people(3)
            .duration(createTravelPackageRequest.duration())
            .travelRoute(createTravelPackageRequest.travelRoute())
            .build();

        return travelRepository.save(travelPackage);
    }

    public TravelPackage getTravelPackage(Long packageId) {
        return travelRepository.findById(packageId)
            .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 패키지 아이디입낟."));
    }
}
