package com.niit.Mychatbackend.test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;



public class Usertest {
	public static void main(String arg[]) {
		try
		{
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	context.scan("com.niit.Mychatbackend.Config");
	context.refresh();
	context.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	//.close();
	/*
	UserDAO userDAO = (UserDAO) context.getBean("userDAO");
	User_ user = (User_) context.getBean("user");
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
	userDAO.saveOrUpdate(user);*/
}

}
