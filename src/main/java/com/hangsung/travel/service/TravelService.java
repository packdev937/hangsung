package com.hangsung.travel.service;

import com.hangsung.city.domain.City;
import com.hangsung.city.domain.repository.CityRepository;
import com.hangsung.travel.domain.TravelPackage;
import com.hangsung.travel.domain.repository.TravelRepository;
import com.hangsung.travel.request.CreateTravelPackageRequest;
import com.hangsung.user.domain.User;
import com.hangsung.user.domain.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
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
    private final DataSource dataSource;
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
            .likes(0)
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

    public List<TravelPackage> getTopFourLikedPackages() throws SQLException {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            return null;
        }
        List<TravelPackage> packages = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM travel_package ORDER BY likes DESC LIMIT 4";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
	TravelPackage travelPackage = new TravelPackage();
	travelPackage.setId(rs.getLong("travel_id"));
	travelPackage.setTitle(rs.getString("title"));
	travelPackage.setFilename(rs.getString("filename"));
	travelPackage.setDuration(rs.getString("duration"));
	travelPackage.setPeople(rs.getInt("people"));
	travelPackage.setPrice(rs.getInt("price"));
	travelPackage.setLikes(rs.getInt("likes"));
	travelPackage.setTravelRoute(rs.getString("travel_route"));
	travelPackage.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());

	Long cityId = rs.getLong("city_id");
	City city = cityRepository.findById(cityId)
	    .orElseThrow(() -> new IllegalArgumentException());
	travelPackage.setCity(city);

	Long userId = rs.getLong("user_id");
	User user = userRepository.findById(userId)
	    .orElseThrow(() -> new IllegalArgumentException());
	travelPackage.setUser(user);

	packages.add(travelPackage);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
	try {
	    rs.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
            if (pstmt != null) {
	try {
	    pstmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
            if (conn != null) {
	try {
	    conn.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
        }

        return packages;
    }

    public List<TravelPackage> getFourRecentPackages() throws SQLException {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            return null;
        }
        List<TravelPackage> packages = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM travel_package ORDER BY created_at DESC LIMIT 4";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
	TravelPackage travelPackage = new TravelPackage();
	travelPackage.setId(rs.getLong("travel_id"));
	travelPackage.setTitle(rs.getString("title"));
	travelPackage.setFilename(rs.getString("filename"));
	travelPackage.setDuration(rs.getString("duration"));
	travelPackage.setPeople(rs.getInt("people"));
	travelPackage.setPrice(rs.getInt("price"));
	travelPackage.setLikes(rs.getInt("likes"));
	travelPackage.setTravelRoute(rs.getString("travel_route"));
	travelPackage.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());

	Long cityId = rs.getLong("city_id");
	City city = cityRepository.findById(cityId)
	    .orElseThrow(() -> new IllegalArgumentException());
	travelPackage.setCity(city);

	Long userId = rs.getLong("user_id");
	User user = userRepository.findById(userId)
	    .orElseThrow(() -> new IllegalArgumentException());
	travelPackage.setUser(user);

	packages.add(travelPackage);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
	try {
	    rs.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
            if (pstmt != null) {
	try {
	    pstmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
            if (conn != null) {
	try {
	    conn.close();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
            }
        }

        return packages;
    }

    public void removeCart(Long travelPackageId, HttpSession session) {
        ArrayList<TravelPackage> cart = (ArrayList<TravelPackage>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        int idx = 0;
        for (TravelPackage pkg : cart) {
            if (pkg.getId() == travelPackageId) {
	cart.remove(idx);
	break;
            }
            idx++;
        }

        log.info("Cart size after removing package : " + cart.size());
    }

    public void orderPacakge(Long travelPackageId, HttpSession session) {
        TravelPackage travelPackage = travelRepository.findById(travelPackageId)
            .orElseThrow(() -> new IllegalArgumentException());

        ArrayList<TravelPackage> orderList = (ArrayList<TravelPackage>) session.getAttribute(
            "order");

        orderList.add(travelPackage);
    }

    public void orderCart(HttpSession session) {
        ArrayList<TravelPackage> cartList = (ArrayList<TravelPackage>) session.getAttribute("cart");
        ArrayList<TravelPackage> orderList = (ArrayList<TravelPackage>) session.getAttribute(
            "order");

        for (TravelPackage pkg : cartList) {
            orderList.add(pkg);
        }

        cartList = new ArrayList<>();
        session.setAttribute("cart", cartList);
        log.info("cartSize after order All Packages : " + cartList.size());
        return;
    }
}
