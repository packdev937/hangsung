package com.hangsung.travel.request;

import com.hangsung.city.domain.City;

public record CreateTravelPackageRequest(String title, City destination, String photoUrl,
		         String duration,
		         int people, String travelRoute) {

}
