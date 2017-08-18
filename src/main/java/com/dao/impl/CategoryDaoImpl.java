package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CategoryDao;
import com.models.Category;

@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    

    public Category getCategoryById(long categoryId) {
        Session session = sessionFactory.getCurrentSession();
        return (Category) session.get(Category.class, categoryId);
    }

    public void addCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.save(category);
        session.flush();        
    }

    @Override
    public void editCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(category);
        session.flush();        
    }

    @Override
    public void deleteCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(category);        
    }

    @Override
    public List<Category> getCategoriesList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Category");
        List<Category> categories = query.list();
        session.flush();
        return categories;
    }

}
