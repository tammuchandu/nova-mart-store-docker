package com.nt.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.nt.model.Product;
import com.nt.service.ProductServiceINF;

@Controller
public class ProductController {

    @Autowired
    private ProductServiceINF service;

    @GetMapping("/products")
    public String showProducts(
            @PageableDefault(
                page = 0,
                size = 3,
                sort = "id",
                direction = Sort.Direction.ASC
            ) Pageable pageable,
            Map<String, Object> map) {
    	/* @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "3") 
    	 * int size, Model model) *//* @RequestParam(defaultValue = "0") int page,
    	 *  @RequestParam(defaultValue = "3") int size, Model model) */

        Page<Product> productPage = service.getAllProducts(pageable);
     // IMPORTANT 
        /* model.addAttribute("products", productPage.getContent()); 
        model.addAttribute("currentPage", page);
         model.addAttribute("totalPages", productPage.getTotalPages());*/

        map.put("pageData", productPage);

        return "products"; // products.jsp
    }

    @GetMapping(
        value = "/product/image/{id}",
        produces = MediaType.IMAGE_JPEG_VALUE
    )
    public ResponseEntity<byte[]> image(@PathVariable Long id) {

        Product product = service.getProductById(id);

        if (product == null || product.getImage() == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(product.getImage());
    }
}