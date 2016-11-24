package com.niit.appleproduct.dao;

import java.util.List;

import com.niit.appleproduct.models.Cart;

public interface CartDAO {

	public List<Cart> list(String loggedInUser);
	public Cart get(int id);
	public void saveOrUpdate(Cart cart);
	public void delete(int id);
	public Long getTotal(String loggedInUser);

}
