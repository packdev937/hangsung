package com.hangsung.travel.service;

import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TravelService {

    private final TravelRepository travelRepository;

    public void createTravelPackage(CreateTravelPackageRequest createTravelPackageRequest) {
        TravelPackage travelPackage = TravelPackage.builder()
            .title(createTravelPackageRequest.title())
            .destination(createTravelPackageRequest.destination())
            .photoUrl(createTravelPackageRequest.photoUrl())
            .recommendedNumberOfPeople(createTravelPackageRequest.recommendedNumberOfPeople())
            .travelRoute(createTravelPackageRequest.travelRoute())
            .build();

        travelRepository.save(travelPackage);
    }

}
