package com.niit.Mychatbackend.Dao;

import java.util.List;

import com.niit.Mychatbackend.Model.Profile_;


public interface ProfileDAO {

	public List<Profile_> list();

	public Profile_ get(String username);

	public void saveOrUpdate(Profile_ profile);

	public void delete(String username);

}
