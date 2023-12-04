package com.hangsung.travel.domain.repository;

import com.hangsung.travel.domain.TravelPackage;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TravelRepository extends JpaRepository<TravelPackage, Long> {

}
