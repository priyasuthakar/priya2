package com.niit.appleproduct.dao;

import java.util.List;

import com.niit.appleproduct.models.Catagory;

public interface CatagoryDAO {

	public List<Catagory> list();

	public Catagory get(int id);

	public void saveOrUpdate(Catagory catagory);

	public void delete(int id);
	
	public Catagory getByName(String name);

}
