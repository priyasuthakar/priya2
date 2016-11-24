package com.niit.appleproduct.dao;

import java.util.List;
import com.niit.appleproduct.models.Buy;

public interface BuyDAO {
	
	public List<Buy> list(String loggedInUser);

	public Buy get(int id);

	public void saveOrUpdate(Buy buy);
	
}
