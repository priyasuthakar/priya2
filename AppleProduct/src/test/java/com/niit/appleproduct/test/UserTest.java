package com.niit.appleproduct.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.appleproduct.dao.UserDAO;
import com.niit.appleproduct.models.User;

public class UserTest {
	public static void main(String arg[]) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.appleproduct");
		context.refresh();
		
		UserDAO userDAO = (UserDAO) context.getBean("userDAO");
		User user = (User) context.getBean("user");
		user.setFirstname("priya");
		user.setLastname("s"); 
		user.setAge("21");
		user.setGender("female");
		user.setMobileno("8903721630");
		user.setEmailid("priyaasuthakar@gmail.com");
		user.setAddress("aaaaa");
		user.setState("tamilnadu");
		user.setCountry("india");
		user.setPincode("613004");
		user.setUsername("priyas");
		user.setPassword("priya143");
		user.setConfirmpassword("priya143");
		user.setEnabled(true);
		user.setRole("user");
		userDAO.saveOrUpdate(user);
	}

}
