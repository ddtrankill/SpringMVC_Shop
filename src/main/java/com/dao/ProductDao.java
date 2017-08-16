package com.dao;

import java.util.List;

import com.models.Product;

public interface ProductDao {

    List<Product> getProductList();

    Product getProductById(int id);

    List<Product> getProductsByName(String name);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);
}
