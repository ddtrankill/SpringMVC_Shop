package com.service;


import com.models.Cart;
import com.models.CartItem;

public interface CartItemService {

    void addCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);
    
    public CartItem getCartItemById(int cartItemId);

    CartItem getCartItemByProductId(int productId);

}
