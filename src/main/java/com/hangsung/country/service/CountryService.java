package com.hangsung.country.service;

import com.hangsung.country.domain.Country;
import com.hangsung.country.domain.repository.CountryRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CountryService {

    private final CountryRepository countryRepository;

    public List<Country> findAllCountries(){
        return countryRepository.findAll();
    }
}
