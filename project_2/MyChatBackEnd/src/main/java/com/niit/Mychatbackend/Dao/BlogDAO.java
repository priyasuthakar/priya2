package com.niit.Mychatbackend.Dao;

import java.util.List;

import com.niit.Mychatbackend.Model.Blog_;

public interface BlogDAO {
	
	public List<Blog_> list();

	public Blog_ get(String username);

	public void saveOrUpdate(Blog_ blog);

	public void delete(String username);
}
