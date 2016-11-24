package com.niit.Mychatbackend.Dao;

import java.util.List;

import com.niit.Mychatbackend.Model.Friend_;

public interface FriendDAO {

	public List<Friend_> list();

	public Friend_ get(String username);

	public void saveOrUpdate(Friend_ friend);

	public void delete(String username);
	
}
