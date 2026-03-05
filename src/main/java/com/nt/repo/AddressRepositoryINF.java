package com.nt.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nt.model.Address;

public interface AddressRepositoryINF extends JpaRepository<Address, Long> {

    Address findByUsername(String username);

    Address findByUsernameAndHouseAndCityAndPincode(
            String username,
            String house,
            String city,
            String pincode
    );
}