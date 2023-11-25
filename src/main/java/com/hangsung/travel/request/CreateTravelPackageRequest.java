package com.hangsung.travel.request;

import com.hangsung.city.domain.City;
import org.springframework.web.multipart.MultipartFile;

public record CreateTravelPackageRequest(String title, City destination,
		         String duration, MultipartFile photo,
		         int people, String travelRoute) {

}
