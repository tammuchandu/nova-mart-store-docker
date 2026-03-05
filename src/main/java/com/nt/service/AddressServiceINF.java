package com.nt.service;

import com.nt.model.Address;
import com.nt.model.User;

public interface AddressServiceINF {

    void saveOrUpdateAddress(Address address, User user);

}