package com.niit.Mychatbackend.service;

import java.util.List;

import com.niit.Mychatbackend.Model.UserDetails;

public interface UserService {
	UserDetails findById(long id);
    
    UserDetails findByName(String name);
     
    void saveUser(UserDetails user);
     
    void updateUser(UserDetails user);
     
    void deleteUserById(long id);
 

     
    void deleteAllUsers();
     
    public boolean isUserExist(UserDetails user);

    /*new*/
    public void saveOrUpdate(UserDetails user);
   
    List<UserDetails> findAllUsers(); 
}
