package com.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Category implements Serializable {

    private static final long serialVersionUID = 7132340697925382626L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long categoryId;
    
    @NotEmpty(message = "The category name must not be empty")
    private String categoryName;
    
    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}
