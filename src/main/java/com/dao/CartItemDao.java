package com.dao;


import com.models.Cart;
import com.models.CartItem;

public interface CartItemDao {

    void addCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    public CartItem getCartItemById(int cartItemId);
    
    CartItem getCartItemByProductId(int productId);
}
