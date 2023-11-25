package com.hangsung.city.service;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CityService {

    private final CityRepository cityRepository;

    public List<City> findAllCities() {
        return cityRepository.findAll();
    }

}
