package com.niit.Mychatbackend.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niit.Mychatbackend.Model.UserDetails;
import com.niit.Mychatbackend.Dao.UserDAO;

@Service("userService")
public class UserServiceImpl implements UserService{
     
	@Autowired
	private UserDAO userDAO;
    private static final AtomicLong counter = new AtomicLong();

    private static List<UserDetails> users;    
    static{
        users= populateDummyUsers();
    }
 
	public UserDetails findById(long id) {
        for(UserDetails user : users){
            if(user.getUserid() == id){
                return user;
            }
        }
        return null;
    }
     
    public UserDetails findByName(String name) {
        for(UserDetails user : users){
            if(user.getUsername().equalsIgnoreCase(name)){
                return user;
            }
        }
        return null;
    }
     
    public void saveUser(UserDetails user) 
    {
        user.setUserid(counter.incrementAndGet());
        users.add(user);
    }
    
    public void updateUser(UserDetails user) 
    {
        int index = users.indexOf(user);
        users.set(index, user);
    }
 
    public void deleteUserById(long id) 
    {     
        for (Iterator<UserDetails> iterator = users.iterator(); iterator.hasNext(); ) {
            UserDetails user = iterator.next();
            if (user.getUserid() == id) {
                iterator.remove();
            }
        }
    }
 
    public boolean isUserExist(UserDetails user) {
        return findByName(user.getUsername())!=null;
    }
     
    public void deleteAllUsers(){
        users.clear();
    }
 
    private static List<UserDetails> populateDummyUsers(){
        List<UserDetails> users = new ArrayList<UserDetails>();
        users.add(new UserDetails());
        users.add(new UserDetails());
        users.add(new UserDetails());
        return users;
    }
    
    /*new*/
    public void saveOrUpdate(UserDetails user){
        userDAO.saveOrUpdate(user);
        }
    
    public List<UserDetails> findAllUsers() {
        List<UserDetails> users=userDAO.list();
           return users;
       }
        
}