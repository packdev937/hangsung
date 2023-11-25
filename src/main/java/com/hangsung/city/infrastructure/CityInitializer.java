package com.hangsung.city.infrastructure;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.Country;
import com.hangsung.city.domain.repository.CityRepository;
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

    @PostConstruct
    public void setup() {
        // 한국의 도시
        List<City> koreanCities = Arrays.asList(
            new City("서울", Country.KOREA), new City("부산", Country.KOREA),
            new City("인천", Country.KOREA), new City("대구", Country.KOREA),
            new City("광주", Country.KOREA), new City("대전", Country.KOREA),
            new City("울산", Country.KOREA), new City("세종", Country.KOREA),
            new City("수원", Country.KOREA), new City("고양", Country.KOREA));

        List<City> japaneseCities = Arrays.asList(
            new City("도쿄", Country.JAPAN), new City("오사카", Country.JAPAN),
            new City("교토", Country.JAPAN), new City("요코하마", Country.JAPAN),
            new City("나고야", Country.JAPAN), new City("삿포로", Country.JAPAN),
            new City("후쿠오카", Country.JAPAN), new City("고베", Country.JAPAN),
            new City("센다이", Country.JAPAN), new City("히로시마", Country.JAPAN)
            );

        List<City> allCities = new ArrayList<>();
        allCities.addAll(koreanCities);
        allCities.addAll(japaneseCities);

        cityRepository.saveAll(allCities);

    }
}
