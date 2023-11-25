package com.hangsung.travel.service;

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
    private final String uploadPath = "/Users/gundorit/upload";

    @Transactional
    public TravelPackage createTravelPackage(
        CreateTravelPackageRequest createTravelPackageRequest, HttpSession session)
        throws IOException {

        Long userId = (Long) session.getAttribute("userId");
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));
        MultipartFile file = createTravelPackageRequest.photo(); // MultipartFile을 포함하는 요청 객체
        String fileName = storeFile(file);

        TravelPackage travelPackage = TravelPackage.builder()
            .title(createTravelPackageRequest.title())
            .destination(createTravelPackageRequest.destination())
            .filename(fileName)
            .people(createTravelPackageRequest.people())
            .duration(createTravelPackageRequest.duration())
            .travelRoute(createTravelPackageRequest.travelRoute())
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

}
