package com.niit.Mychatbackend.Dao;

import java.util.List;

import com.niit.Mychatbackend.Model.UserDetails;

public interface UserDAO {
	
	public List<UserDetails> list();

	public UserDetails get(String username);

	public void saveOrUpdate(UserDetails userdetails);

	public void delete(String username);

	public boolean isValidUser(String username, String password);

}
