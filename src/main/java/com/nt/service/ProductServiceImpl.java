package com.nt.service;

import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.beans.factory.annotation.Autowired;

import com.nt.model.Product;
import com.nt.repo.ProductRepoINF;
import org.springframework.data.domain.Pageable;
@Service
public class ProductServiceImpl implements ProductServiceINF {

    @Autowired
    private ProductRepoINF repo;

    @Override
    public Page<Product> getAllProducts(Pageable pageable) {
        return repo.findAll(pageable);
    }
    /*Page<Product> getAllProducts(init page,init size,sort id,direaction.ASC){
     * Page<Product> page =PageRequest.Of(page,size,direaction.ASC);
     * return repo.FindAll(page);
     * 
     * } */

    @Override
    public Product getProductById(Long id) {
        return repo.findById(id).orElse(null);
    }
}