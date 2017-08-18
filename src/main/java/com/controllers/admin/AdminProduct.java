package com.controllers.admin;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.models.Category;
import com.models.Product;
import com.service.CategoryService;
import com.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminProduct {

    private Path path;

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/product/addProduct")
    public String addProduct(Model model) {
        Product product = new Product();
        List<Category> categories = categoryService.getCategoriesList();
        product.setProductCondition("new");
        product.setProductStatus("active");
        model.addAttribute("categories", categories);
        model.addAttribute("product", product);

        return "addProduct";
    }

    @RequestMapping(value = "/product/addProduct", method = RequestMethod.POST)
    public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result,
            HttpServletRequest request) {

        if (result.hasErrors()) {
            return "addProduct";
        }
        productService.addProduct(product);

        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId() + ".png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new RuntimeException("Product image saving failed", ex);
            }
        }

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/product/editProduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id);
        List<Category> categories = categoryService.getCategoriesList();

        model.addAttribute("product", product);
        model.addAttribute("categories", categories);

        return "editProduct";
    }

    @RequestMapping(value = "/product/editProduct", method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result,
            HttpServletRequest request) {

        if (result.hasErrors()) {
            return "editProduct";
        }

        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId() + ".png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new RuntimeException("Product image saving failed", ex);
            }
        }

        productService.editProduct(product);

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/product/deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id, Model model, HttpServletRequest request) {
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + id + ".png");

        if (Files.exists(path)) {
            try {
                Files.delete(path);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        Product product = productService.getProductById(id);
        productService.deleteProduct(product);

        return "redirect:/admin/productInventory";
    }

    /**
     * Methods for categories manipulations
     */

    @RequestMapping("/category/addCategory")
    public String addCategory(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "category/addCategory";
    }

    @RequestMapping(value = "/category/addCategory", method = RequestMethod.POST)
    public String addCategoryPost(@Valid @ModelAttribute("category") Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "category/addCategory";
        }
        categoryService.addCategory(category);
        return "redirect:/admin/category/all";
    }

    @RequestMapping("/category/all")
    public String allCategories(Model model) {
        List<Category> categories = categoryService.getCategoriesList();
        model.addAttribute("categories", categories);
        return "category/categoryList";
    }

    @RequestMapping("/category/edit/{id}")
    public String editCategory(@PathVariable("id") long categoryId, Model model) {
        Category category = categoryService.getCategoryById(categoryId);
        model.addAttribute("category", category);
        return "category/editCategory";
    }

    @RequestMapping(value = "/category/edit", method = RequestMethod.POST)
    public String editCategoryPost(@Valid @ModelAttribute("category") Category category, BindingResult result) {
        if (result.hasErrors()) {
            return "category/editCategory";            
        }
        categoryService.editCategory(category);
        return "redirect:/admin/category/all";
    }
    
    @RequestMapping(value = "/category/delete/{categoryId}", method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void deleteCategory(@PathVariable long categoryId) {
        Category category = categoryService.getCategoryById(categoryId);
        categoryService.deleteCategory(category);
    }
}
