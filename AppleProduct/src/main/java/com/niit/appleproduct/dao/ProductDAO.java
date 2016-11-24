package com.niit.appleproduct.dao;

import java.util.List;

import com.niit.appleproduct.models.Product;

public interface ProductDAO {

	public List<Product> list();

	public Product get(int id);

	public void saveOrUpdate(Product product);
	
	public void delete(int id);
	
	public List <Product> getByCatagory(int catagoryId);
	
	public List <Product> getBySupplier(int supplierId);
	
	public List<Product> getByProduct(int id);
	
}
