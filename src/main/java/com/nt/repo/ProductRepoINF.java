package com.nt.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.nt.model.Product;

public interface ProductRepoINF extends JpaRepository<Product, Long> {}