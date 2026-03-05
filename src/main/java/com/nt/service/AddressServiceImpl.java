package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Address;
import com.nt.model.User;
import com.nt.repo.AddressRepositoryINF;

@Service
public class AddressServiceImpl implements AddressServiceINF {

    @Autowired
    private AddressRepositoryINF repo;

    @Override
    public void saveOrUpdateAddress(Address address, User user) {

        // Check duplicate address for same user
        Address duplicate = repo.findByUsernameAndHouseAndCityAndPincode(
                user.getUsername(),
                address.getHouse(),
                address.getCity(),
                address.getPincode()
        );

        if (duplicate != null) {
            // Address already exists for this user
            return;
        }

        // Check if user already has address
        Address existing = repo.findByUsername(user.getUsername());

        if (existing != null) {

            existing.setHouse(address.getHouse());
            existing.setCity(address.getCity());
            existing.setPincode(address.getPincode());

            repo.save(existing);

        } else {

            address.setUsername(user.getUsername());
            repo.save(address);

        }
    }
}