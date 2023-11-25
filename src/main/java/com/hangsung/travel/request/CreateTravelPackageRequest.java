package com.hangsung.travel.request;

import com.hangsung.city.domain.City;
import java.util.List;

public record CreateTravelPackageRequest(String title, City destination, String photoUrl,
		         int recommendedNumberOfPeople, String travelRoute) {

}
