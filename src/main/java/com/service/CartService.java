package com.service;

import com.models.Cart;

public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
