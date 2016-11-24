package com.niit.Mychatbackend.Dao;

import java.util.List;

import com.niit.Mychatbackend.Model.Chat_;

public interface ChatDAO {
	
	public List<Chat_> list();

	public Chat_ get(String username);

	public void saveOrUpdate(Chat_ chat);

	public void delete(String username);

}
