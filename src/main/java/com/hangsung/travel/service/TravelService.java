package com.hangsung.travel.service;

import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.travel.response.LikeCountResponse;
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
        MultipartFile file = createTravelPackageRequest.photo();
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

    @Transactional
    public TravelPackage addLike(Long travelPackageId) {
        TravelPackage travelPackage = travelRepository.findById(travelPackageId).orElseThrow();
        travelPackage.addLike();
        return travelRepository.save(travelPackage);
    }

//    @PostMapping("/add-to-cart")
//    public String addToCart(@RequestParam("packageId") Long packageId,
//        HttpServletRequest request,
//        HttpServletResponse response) {
//        String cartId = getCartIdFromCookie(request);
//
//        if (cartId == null) {
//            cartId = createNewCartId(); // 서버에서 새로운 장바구니 식별자 생성
//            Cookie cartCookie = new Cookie("cartId", cartId);
//            cartCookie.setMaxAge(7 * 24 * 60 * 60); // 쿠키 유효기간 설정
//            cartCookie.setHttpOnly(true); // JavaScript 접근 방지
//            cartCookie.setPath("/"); // 적용 경로 설정
//            response.addCookie(cartCookie); // 쿠키 응답에 추가
//        }
//
//        // 서버 측에서 장바구니 업데이트
//        updateCart(cartId, packageId);
//
//        return "redirect:/cart";
//    }

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
