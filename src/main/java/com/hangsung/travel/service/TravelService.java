package com.hangsung.travel.service;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Slf4j
public class TravelService {

    private final TravelRepository travelRepository;
    private final UserRepository userRepository;
    private final CityRepository cityRepository;
    private final String uploadPath = "/Users/gundorit/upload";

    @Transactional
    public TravelPackage createTravelPackage(
        CreateTravelPackageRequest createTravelPackageRequest, Long userId)
        throws IOException {

        User user = userRepository.findById(userId)
            .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));

        MultipartFile file = createTravelPackageRequest.photo();
        String fileName = storeFile(file);
        City city = cityRepository.findById(Long.parseLong(createTravelPackageRequest.city()))
            .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 도시입니다."));

        TravelPackage travelPackage = TravelPackage.builder()
            .title(createTravelPackageRequest.title())
            .city(city)
            .filename(fileName)
            .people(createTravelPackageRequest.people())
            .duration(createTravelPackageRequest.duration())
            .travelRoute(createTravelPackageRequest.travelRoute())
            .price(createTravelPackageRequest.price())
            .user(user)
            .build();

        user.addTravelPackage(travelPackage);
        return travelRepository.save(travelPackage);
    }

    public TravelPackage getTravelPackage(Long packageId) {
        System.out.println(packageId);
        return travelRepository.findById(packageId)
            .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 패키지 입니다."));
    }

    private String storeFile(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        Path filePath = Paths.get(uploadPath, fileName);

        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return fileName;
    }

    @Transactional
    public TravelPackage addLike(Long travelPackageId) {
        TravelPackage travelPackage = travelRepository.findById(travelPackageId).orElseThrow();
        travelPackage.addLike();
        return travelRepository.save(travelPackage);
    }

    public void addCart(Long travelPackageId, HttpSession session) {
        TravelPackage travelPackage = travelRepository.findById(travelPackageId)
            .orElseThrow(() -> new IllegalArgumentException());

        ArrayList<TravelPackage> cart = (ArrayList<TravelPackage>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        cart.add(travelPackage);
    }

    public List<TravelPackage> getTopFiveLikedPackages() {
        return travelRepository.findTop5ByOrderByLikesDesc();
    }

    public List<TravelPackage> getFiveRecentPackages() {
        return travelRepository.findTop5ByOrderByCreatedAtDesc();
    }


    private String getCartIdFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
	if ("cartId".equals(cookie.getName())) {
	    return cookie.getValue();
	}
            }
        }
        return null;
    }
}
