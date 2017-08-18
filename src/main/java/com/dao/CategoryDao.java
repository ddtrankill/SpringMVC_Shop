package com.dao;

import java.util.List;

import com.models.Category;

public interface CategoryDao {
    Category getCategoryById(long categoryId);

    void addCategory(Category category);

    void editCategory(Category category);

    void deleteCategory(Category category);
    
    List<Category> getCategoriesList();
}
