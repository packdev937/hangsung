package com.hangsung.city.infrastructure;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.country.domain.Country;
import com.hangsung.country.domain.repository.CountryRepository;
import jakarta.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class CityInitializer {

    private final CityRepository cityRepository;
    private final CountryRepository countryRepository;

    @PostConstruct
    public void setup() {

        Country korea = new Country("한국");
        Country japan = new Country("일본");

        countryRepository.saveAll(Arrays.asList(korea, japan));

        List<City> koreanCities = Arrays.asList(
            new City("서울", korea), new City("부산", korea),
            new City("인천", korea), new City("대구", korea),
            new City("광주", korea), new City("대전", korea),
            new City("울산", korea), new City("세종", korea),
            new City("수원", korea), new City("고양", korea));

        List<City> japaneseCities = Arrays.asList(
            new City("도쿄", japan), new City("오사카", japan),
            new City("교토", japan), new City("요코하마", japan),
            new City("나고야", japan), new City("삿포로", japan),
            new City("후쿠오카", japan), new City("고베", japan),
            new City("센다이", japan), new City("히로시마", japan)
        );

        List<City> allCities = new ArrayList<>();
        allCities.addAll(koreanCities);
        allCities.addAll(japaneseCities);

        cityRepository.saveAll(allCities);
    }
}
