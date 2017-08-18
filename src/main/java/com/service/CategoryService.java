package com.service;

import java.util.List;

import com.models.Category;

public interface CategoryService {
    Category getCategoryById(long categoryId);
    
    List<Category> getCategoriesList();

    void addCategory(Category category);

    void editCategory(Category category);
    
    void deleteCategory(Category category);
}
