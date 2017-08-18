package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CategoryDao;
import com.models.Category;
import com.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public Category getCategoryById(long categoryId) {
        return categoryDao.getCategoryById(categoryId);
    }

    @Override
    public void addCategory(Category category) {
        categoryDao.addCategory(category);
    }

    @Override
    public List<Category> getCategoriesList() {
        return categoryDao.getCategoriesList();
    }

    @Override
    public void editCategory(Category category) {
        categoryDao.editCategory(category);
    }

    @Override
    public void deleteCategory(Category category) {
        categoryDao.deleteCategory(category);
    }

}
