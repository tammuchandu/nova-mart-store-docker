package com.nt.service;
import org.springframework.data.domain.Page;

import com.nt.model.Product;
import org.springframework.data.domain.Pageable;


public interface ProductServiceINF {
    
    Page<Product> getAllProducts(Pageable pageable);
    Product getProductById(Long id);
}