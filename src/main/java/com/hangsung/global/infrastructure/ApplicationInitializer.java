package com.hangsung.global.infrastructure;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.country.domain.Country;
import com.hangsung.country.domain.repository.CountryRepository;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.user.domain.Gender;
import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import jakarta.annotation.PostConstruct;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class ApplicationInitializer {

    private final UserRepository userRepository;
    private final CityRepository cityRepository;
    private final CountryRepository countryRepository;
    private final TravelRepository travelRepository;

    @PostConstruct
    void init(){
        List<User> allUsers = Arrays.asList(User.builder()
	.username("admin")
	.password("1234")
	.nickname("관리자")
	.birthAt(LocalDate.of(1999, 3, 27))
	.gender(Gender.MALE)
	.build(),
            User.builder()
	.username("test1")
	.password("1234")
	.nickname("지존이성행123")
	.birthAt(LocalDate.of(1999, 3, 27))
	.gender(Gender.MALE)
	.build(),
            User.builder()
	.username("test2")
	.password("1234")
	.nickname("행성이성행")
	.birthAt(LocalDate.of(1999, 3, 27))
	.gender(Gender.MALE)
	.build(),
            User.builder()
	.username("test2")
	.password("1234")
	.nickname("겨울이추워")
	.birthAt(LocalDate.of(1999, 3, 27))
	.gender(Gender.MALE)
	.build());

        userRepository.saveAll(allUsers);

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
        // 도시 로드
        City seoul = cityRepository.findById(1L).orElseThrow();
        City busan = cityRepository.findById(2L).orElseThrow();
        City tokyo = cityRepository.findById(11L).orElseThrow();
        City osaka = cityRepository.findById(12L).orElseThrow();

        // 유저 로드
        User admin = userRepository.findById(1L).orElseThrow();
        User user1 = userRepository.findById(2L).orElseThrow();
        User user2 = userRepository.findById(3L).orElseThrow();
        User user3 = userRepository.findById(4L).orElseThrow();

        // 여행 패키지 생성
        List<TravelPackage> allPackages = Arrays.asList(
            TravelPackage.builder().title("서울 역사 투어").city(seoul).filename("seoul1.jpg").people(2)
	.duration("1박 2일").travelRoute("경복궁, 북촌").likes(5).price(45000).user(admin).build(),
            TravelPackage.builder().title("부산 바다 여행").city(busan).filename("busan1.jpg").people(4)
	.duration("3박 4일").travelRoute("태종대, 감천문화마을").likes(2).price(65000).user(user1)
	.build(),
            TravelPackage.builder().title("도쿄 디즈니랜드 여행").city(tokyo).filename("tokyo1.jpg")
	.people(3).duration("2박 3일").travelRoute("디즈니랜드, 오다이바").likes(11).price(1000000)
	.user(user2)
	.build(),
            TravelPackage.builder().title("오사카 미식 투어").city(osaka).filename("osaka1.jpg").people(2)
	.duration("5박 6일").travelRoute("도톤보리, 신사이바시").likes(23).price(800000).user(user3)
	.build(),
            TravelPackage.builder().title("서울 쇼핑 투어").city(seoul).filename("seoul2.jpg").people(1)
	.duration("2박 3일").travelRoute("더현대, 명동, 동대문").likes(13).price(120000).likes(3)
	.user(admin).build(),
            TravelPackage.builder().title("부산 온천 여행").city(busan).filename("busan2.jpg").people(2)
	.duration("3박 4일").travelRoute("해운대, 온천").likes(8).price(70000).user(user1).build(),
            TravelPackage.builder().title("도쿄 애니메이션 투어").city(tokyo).filename("tokyo2.jpg")
	.people(3).duration("3박 4일").travelRoute("아키하바라, 지브리 미술관").likes(2).price(550000)
	.user(user2)
	.build(),
            TravelPackage.builder().title("오사카 역사 여행").city(osaka).filename("osaka2.jpg").people(4)
	.duration("4박 5일").travelRoute("오사카성, 우메다 스카이 빌딩").likes(0).price(700000)
	.user(user3)
	.build(),
            TravelPackage.builder().title("서울 야경 투어").city(seoul).filename("seoul3.jpg").people(2)
	.duration("1박 2일").travelRoute("남산타워, 한강").likes(7).price(50000).user(admin)
	.build(),
            TravelPackage.builder().title("부산 해산물 체험").city(busan).filename("busan3.jpg").people(4)
	.duration("2박 3일").travelRoute("자갈치 시장, 국제시장").likes(9).price(55000).user(user1)
	.build()
        );

        travelRepository.saveAll(allPackages);
    }

}
